-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'disable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;

  documentation = {
	border = "rounded",
	winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
	max_width = 120,
	min_width = 60,
	max_height = math.floor(vim.o.lines * 0.3),
	min_height = 1,
  };

  source = {
	path = true;
	buffer = true;
	nvim_lsp = true;
	nvim_lua = true;
	ultisnips = true;
	treesitter = false;
	omni = {
		filetypes = {'tex'};
	};
  };
}
