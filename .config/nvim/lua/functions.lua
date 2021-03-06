local npairs = require('nvim-autopairs')

-- module to export
local fn = {}

-- check back spaces
local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- run through checking ultisnips viability. Returns fallthrough if fails
local trigger_ultisnips_fwd = function(fallthrough)
    if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
        return fn.t([[<C-R>=UltiSnips#ExpandSnippet()<CR>]])
    elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        return fn.t([[<C-R>=UltiSnips#JumpForwards()<CR>]])
    else
        return fallthrough
    end
end

-- run through s-tab options too
local trigger_ultisnips_bak = function(fallthrough)
    if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        return fn.t([[<C-R>=UltiSnips#JumpBackwards()<CR>]])
    else
        return fallthrough
    end
end


-- EXPORTED FUNCTIONS
-- escape termcodes properly
fn.t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end


-- tab completion for compe
fn.complete_or_next = function(trigger, fallthrough)
    -- if popup visible and has a value selected, go down
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()["selected"] ~= -1 then
        return fallthrough
    -- if popup is visible, but no value selected, attempt snippet expand
    elseif vim.fn.pumvisible() ~= 0 then
        return trigger_ultisnips_fwd(fallthrough)
    elseif check_back_space() then
        return trigger
    else
        return trigger_ultisnips_fwd(trigger)
    end
end

-- s-tab completion for compe
fn.complete_or_back = function(trigger, fallthrough)
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()["selected"] ~= -1 then
        return fallthrough
    -- if popup is visible, but no value selected, attempt snippet previous jump
    elseif vim.fn.pumvisible() ~= 0 then
        return trigger_ultisnips_bak(fallthrough)
    else
        return trigger_ultisnips_bak(trigger)
    end
end

-- enter completion for autopairs and compe
fn.completion_confirm = function(trigger)
    if vim.fn.pumvisible() ~= 0  then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"](npairs.esc(trigger))
        else
            return npairs.esc(trigger)
        end
    else
        return npairs.autopairs_cr()
    end
end

-- quick keymap with default noremap
fn.keymap = function(mode, lhs, rhs, opts)
    options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- smart nav for mapping k -> gk or j -> gj
fn.smart_nav = function(key)
    return vim.v.count == 0 and 'g' .. key or key
end

-- check for pumvisible completions
fn.pumvisible_complete = function(dirkey, key)
    return vim.fn.pumvisible() ~= 0 and fn.t(dirkey) or fn.t(key)
end

-- display syntax group names
fn.syntax_group = function()
    local curr = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
    local orig = vim.fn.synIDattr(curr, 'name')
    local after = vim.fn.synIDattr(vim.fn.synIDtrans(curr), 'name')
    print(orig .. ' -> ' .. after)
end

-- populates location list with lsp diagnostics
fn.lsplocationlist = function()
	vim.lsp.diagnostic.set_loclist({open_loclist = false})
end

-- toggle quickfixlist or locationlist
fn.togglelist = function(listtypeletter)
	-- for some reason, v:val.loclist is always 0, so list will always be empty.
	if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) == 1 then
		vim.api.nvim_command(listtypeletter .. 'open')
    else
		vim.api.nvim_command('lclose')
		vim.api.nvim_command('cclose')
	end
end

return fn
