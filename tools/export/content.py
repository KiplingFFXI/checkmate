"""
Content gating, as luautils::IsContentEnabled does it.

A tagged template, trait or row is off only when RESTRICT_CONTENT is on and its ENABLE_<TAG> setting is off.
The exporter takes these as arguments instead of reading a settings file, because the live server's
settings/main.lua isn't in git.
"""

# Phoenix runs with RESTRICT_CONTENT on and only these expansions on.
DEFAULT_ON = ['rotz', 'cop', 'toau']


class Content:
    def __init__(self, restrict, enabled):
        self.restrict = restrict
        self.enabled = [tag.lower() for tag in enabled]

    def allows(self, tag):
        if not tag or str(tag).lower() == 'none':
            return True
        return str(tag).lower() in self.enabled or not self.restrict

    def stamp(self):
        on = ' '.join(self.enabled) or 'no content'
        return 'RESTRICT_CONTENT %s, %s on, the rest off' % ('on' if self.restrict else 'off', on)
