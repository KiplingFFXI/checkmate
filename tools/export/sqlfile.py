"""Reads the one-row INSERT lines of a Phoenix SQL dump into dicts keyed by column name."""
import re


def split_values(text):
    """Splits the inside of VALUES (...) at top-level commas. Quoted strings keep their commas."""
    values, current, quoted, i = [], '', False, 0
    while i < len(text):
        ch = text[i]
        if quoted:
            if ch == '\\' and i + 1 < len(text):
                current += text[i + 1]
                i += 2
                continue
            if ch == "'":
                if text[i + 1:i + 2] == "'":
                    current += "'"
                    i += 2
                    continue
                quoted = False
            else:
                current += ch
        elif ch == "'":
            quoted = True
        elif ch == ',':
            values.append(current.strip())
            current = ''
        else:
            current += ch
        i += 1
    values.append(current.strip())
    return [convert(v) for v in values]


def convert(value):
    if value == 'NULL':
        return None
    if re.fullmatch(r'-?\d+', value):
        return int(value)
    if re.fullmatch(r'0x[0-9A-Fa-f]+', value):
        return int(value, 16)
    try:
        return float(value)
    except ValueError:
        return value


def columns(text, table):
    """Column names in CREATE TABLE order."""
    body = re.search(r'CREATE TABLE (?:IF NOT EXISTS )?`%s` \((.*?)\n\)' % re.escape(table), text, re.S)
    if body is None:
        raise RuntimeError('no CREATE TABLE for %s' % table)
    return re.findall(r'^\s*`(\w+)`', body.group(1), re.M)


def rows(path, table):
    """Every live row of the table. Commented-out INSERT lines are skipped."""
    text = open(path, encoding='utf-8', errors='replace').read()
    names = columns(text, table)
    pattern = re.compile(r'^INSERT INTO `%s` VALUES \((.*)\);' % re.escape(table))
    out = []
    for line in text.split('\n'):
        match = pattern.match(line)
        if match:
            values = split_values(match.group(1))
            if len(values) != len(names):
                raise RuntimeError('%s: %d values for %d columns in %s' % (path, len(values), len(names), line[:80]))
            out.append(dict(zip(names, values)))
    return out
