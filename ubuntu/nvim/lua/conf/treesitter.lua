local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "Haskell", "Lua", "OCaml", "Ruby", "Rust", "Swift", "Kotlin", "Java", "C", "C#", "C++", "Common Lisp", "CUDA", "DOT", "Elm", "Emacs Lisp", "Eno", "ERB/EJS", "Fennel", "GLSL", "HCL", "Java", "OCaml", "PHP", "Ruby", "Rust", "R", "S-expressions", "SPARQL", "SystemRDL", "Svelte", "Turtle", "Verilog", "VHDL", "Vue", "YAML", "WASM", "WGSL", "Agda", "Elixir", "Erlang", "Dockerfile", "Hack", "Haskell", "Julia", "Kotlin", "Nix", "Objective-C", "Org", "Perl", "Scala", "Sourcepawn", "Swift", "SQL" }, -- List of parsers to ignore installing
  autopairs = {
		enable = true,
	},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
