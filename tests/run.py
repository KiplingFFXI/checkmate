"""
Runs checkmate's offline tests. Each test file runs in a fresh LuaJIT (lupa) with the mock of Ashita in
mock_ashita.lua, loading the real addon and its real monster data from ../checkmate.

    python run.py                    every test_*.lua in this folder
    python run.py test_window.lua    just the ones named

A test fails when it raises an error or prints a line like "2 FAILED". The exit code is 1 when any
test failed.

common.lua, chat.lua, json.lua and imgui.lua come from the Phoenix install's Ashita libs. The game, the
settings library and the GUI manager are mocked in mock_ashita.lua. Set ASHITA_LIBS to point somewhere
else.
"""
import glob
import os
import re
import shutil
import sys
import tempfile

from lupa import luajit21

HERE = os.path.dirname(os.path.abspath(__file__))
ADDON = os.path.join(os.path.dirname(HERE), 'checkmate')
FIXTURES = os.path.join(HERE, 'fixtures')
ASHITA_LIBS = os.environ.get('ASHITA_LIBS', r'C:/Games/PhoenixXI/addons/libs')

# Files the addon writes during a test (profiles.json) go here, outside the project.
INSTALL = os.path.join(tempfile.gettempdir(), 'checkmate_tests')

FAILED_LINE = re.compile(r'^\d+ FAILED$', re.MULTILINE)

# Chat lines can hold Shift-JIS bytes, like the star divider, which aren't UTF-8. The report writes each
# byte over 127 as a Lua escape like \129, so a failed check that shows one still prints.
RUN_ESCAPED = r"""
    return function (chunk)
        local out = chunk();
        if (type(out) == 'string') then
            out = out:gsub('[\128-\255]', function (c) return '\\' .. c:byte(); end);
        end
        return out;
    end
"""


def lua_path(path):
    return path.replace('\\', '/')


def addon_files():
    """Every file in the addon folder, relative to it, with forward slashes."""
    out = []
    for root, _, files in os.walk(ADDON):
        for name in files:
            out.append(lua_path(os.path.relpath(os.path.join(root, name), ADDON)))
    return sorted(out)


def runtime():
    L = luajit21.LuaRuntime(unpack_returned_tuples=True)
    L.execute("package.path = [[%s/?.lua;%s/?.lua;]] .. package.path" % (lua_path(ADDON), lua_path(HERE)))
    L.execute("package.path = package.path .. [[;%s/?.lua]]" % lua_path(ASHITA_LIBS))
    shutil.rmtree(INSTALL, ignore_errors=True)
    os.makedirs(os.path.join(INSTALL, 'config', 'addons', 'checkmate'), exist_ok=True)
    g = L.globals()
    g.MOCK_INSTALL_PATH = INSTALL
    g.ADDON_DIR = lua_path(ADDON)
    g.ADDON_PATH = os.path.join(ADDON, '')
    g.FIXTURES_PATH = os.path.join(FIXTURES, '')
    g.ASHITA_LIBS = lua_path(ASHITA_LIBS)
    g.ADDON_FILES = L.table_from(addon_files())
    L.execute(open(os.path.join(HERE, 'mock_ashita.lua'), encoding='utf-8').read())
    return L


def main(names):
    tests = names or sorted(os.path.basename(p) for p in glob.glob(os.path.join(HERE, 'test_*.lua')))
    failures = 0
    for test in tests:
        L = runtime()
        src = open(os.path.join(HERE, test), encoding='utf-8').read()
        try:
            out = L.execute(RUN_ESCAPED)(L.compile(src))
        except Exception as ex:
            failures += 1
            print(f'!! {test} FAILED: {ex}')
            continue
        print(f'== {test}')
        print(out if out is not None else '(no output)')
        if out is not None and FAILED_LINE.search(str(out)):
            failures += 1
    print(f'\n{len(tests) - failures} of {len(tests)} test files passed.')
    return 1 if failures else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
