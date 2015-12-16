#=============================================================================
# FILE: elixir.py
# AUTHOR: Blaž Hrastnik 
# based on https://github.com/Rip-Rip/clang_complete/blob/master/rplugin/python3/deoplete/sources/clang_complete.py
#=============================================================================

from .base import Base

class Source(Base):
    def __init__(self, vim):
        Base.__init__(self, vim)

        self.name = 'elixir'
        self.mark = '[elixir]'
        self.filetypes = ['elixir']
        self.is_bytepos = False
        self.min_pattern_length = 1

    def get_complete_position(self, context):
        return self.vim.call('ElixirComplete', "1", "")

    def gather_candidates(self, context):
        return self.vim.call('ElixirComplete', 0, context['complete_str'])
