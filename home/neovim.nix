{
  user,
  specialArgs, options, modulesPath,
  lib, pkgs, config, nixosConfig, osConfig
}: {
  programs = {
    neovim = {
      package = pkgs.neovim-unwrapped;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };
  };
  home = {
    file = {
      nvimCraftzdog = {
        target = ".config/nvim/lua/craftzdog/discipline.lua";
        text = ''
          local M = {}

          function M.cowboy()
            ---@type table?
            local id
            local ok = true

            for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
              local count = 0
              local timer = assert(vim.loop.new_timer())
              local map = key
              vim.keymap.set("n", key, function()
                if vim.v.count > 0 then
                  count = 0
                end
                if count >= 10 then
                  ok, id = pcall(vim.notify, "Hold it, cowboy!!", vim.log.levels.WARN, {
                    icon = "🤠",
                    replace = id,
                    keep = function()
                      return count >= 10
                    end,
                  })
                  if not ok then
                    id = nil
                    return map
                  end
                else
                  count = count + 1
                  timer:start(2000, 0, function()
                    count = 0
                  end)
                  return map
                end
              end, { expr = true, silent = true })
            end
          end

          return M
        '';
      };
      nvimConfigAutocmds = {
        target = ".config/nvim/lua/config/autocmds.lua";
        text = ''
          -- Autocmds are automatically loaded on the VeryLazy event
          -- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
          -- Add any additional autocmds here

          -- Turn off paste mode when leaving insert
          vim.api.nvim_create_autocmd("InsertLeave", {
            pattern = "*",
            command = "set nopaste",
          })

          -- Fix conceallevel for json files
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "json", "jsonc" },
            callback = function()
              vim.wo.spell = false
              vim.wo.conceallevel = 0
            end,
          })
        '';
      };
      nvimConfigKeymaps = {
        target = ".config/nvim/lua/config/keymaps.lua";
        text = ''
          -- Keymaps are automatically loaded on the VeryLazy event
          -- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
          -- Add any additional keymaps here
          --
          local discipline = require("craftzdog.discipline")
          discipline.cowboy() -- hi Taku

          local keymap = vim.keymap
          local opts = { noremap = true, silent = true }

          -- Increment / Decrement
          keymap.set("n", "+", "<C-a>")
          keymap.set("n", "-", "<C-x>")

          -- Delete a word backwards
          keymap.set("n", "dw", "vb_d")

          -- Select all
          keymap.set("n", "<C-a>", "gg<S-v>G")

          -- Jump list
          keymap.set("n", "<C-m>", "<C-i>", opts)

          -- New tab
          keymap.set("n", "te", ":tabedit", opts)
          keymap.set("n", "<tab>", ":tabnext<Return>", opts)
          keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

          -- Split window
          keymap.set("n", "ss", ":split<Return>", opts)
          keymap.set("n", "sv", ":vsplit<Return>", opts)

          -- Move window
          keymap.set("n", "sh", "<C-w>h")
          keymap.set("n", "sk", "<C-w>k")
          keymap.set("n", "sj", "<C-w>j")
          keymap.set("n", "sl", "<C-w>l")

          -- Resize window
          keymap.set("n", "<C-w><left>", "<C-w><")
          keymap.set("n", "<C-w><right>", "<C-w>>")
          keymap.set("n", "<C-w><up>", "<C-w>+")
          keymap.set("n", "<C-w><down>", "<C-w>-")

          -- Diagnostics
          keymap.set("n", "<C-j>", function()
            vim.diagnostic.goto_next()
          end, opts)
        '';
      };
      nvimConfigLazy = {
        target = ".config/nvim/lua/config/lazy.lua";
        text = ''
          local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
          if not vim.loop.fs_stat(lazypath) then
            -- bootstrap lazy.nvim
            -- stylua: ignore
            vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
          end
          vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

          require("lazy").setup({
            spec = {
              { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = {
                colorscheme = "solarized-osaka",
              } },
              { import = "lazyvim.plugins.extras.linting.eslint" },
              { import = "lazyvim.plugins.extras.formatting.prettier" },
              { import = "lazyvim.plugins.extras.lang.rust" },
              { import = "lazyvim.plugins.extras.lang.typescript" },
              { import = "lazyvim.plugins.extras.lang.tailwind" },
              { import = "lazyvim.plugins.extras.lang.json" },
              { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
              { import = "lazyvim.plugins.extras.ui.mini-animate" },
              { import = "plugins" },
            },
            defaults = {
              lazy = false,
              version = false,
            },
            install = { colorscheme = { "tokyonight", "habamax" } },
            checker = { enabled = true },
            performance = {
              rtp = {
                disabled_plugins = {
                  "gzip",
                  "tarPlugin",
                  "tohtml",
                  "tutor",
                  "zipPlugin",
                },
              },
            },
          })
        '';
      };
      nvimConfigOptions = {
        target = ".config/nvim/lua/config/options.lua";
        text = ''
          -- Options are automatically loaded before lazy.nvim startup
          -- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
          -- Add any additional options here

          -- Undercurl
          vim.cmd([[let &t_Cs = "\e[4:3m"]])
          vim.cmd([[let &t_Ce = "\e[4:0m"]])
        '';
      };
      nvimPluginsColorscheme = {
        target = ".config/nvim/lua/plugins/colorscheme.lua";
        text = ''
          return {
            "craftzdog/solarized-osaka.nvim",
            lazy = true,
            priority = 1000,
            opts = function()
              return {
                transparent = true,
              }
            end,
          }
        '';
      };
      nvimPluginsEditor = {
        target = ".config/nvim/lua/plugins/editor.lua";
        text = ''
          return {
            "telescope.nvim",
            dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
            keys = {
              {
                "<leader>fP",
                function()
                  require("telescope.builtin").find_files({
                    cwd = require("lazy.core.config").options.root,
                  })
                end,
                desc = "Find Plugin File",
              },
              {
                ";f",
                function()
                  require("telescope.builtin").find_files({ no_ignore = false, hidden = false })
                end,
              },
              {
                ";r",
                function()
                  require("telescope.builtin").live_grep()
                end,
              },
              {
                "\\\\",
                function()
                  require("telescope.builtin").builtin.buffers()
                end,
              },
              {
                ";t",
                function()
                  require("telescope.builtin").builtin.help_tags()
                end,
              },
              {
                ";;",
                function()
                  require("telescope.builtin").builtin.resume()
                end,
              },
              {
                ";e",
                function()
                  require("telescope.builtin").builtin.diagnostics()
                end,
              },
              {
                ";s",
                function()
                  require("telescope.builtin").builtin.treesitter()
                end,
              },
              {
                "sf",
                function()
                  local telescope = require("telescope")
                  local function telescope_buffer_dir()
                    return vim.fn.expand("%:p:h")
                  end
                  telescope.extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = telescope_buffer_dir(),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = false,
                    initial_mode = "normal",
                    layout_config = { height = 40 },
                  })
                end,
              },
            },
            config = function(_, opts)
              local telescope = require("telescope")
              local actions = require("telescope.actions")
              local fb_actions = require("telescope").extensions.file_browser.actions

              opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
                wrap_results = true,
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
                mappings = {
                  n = {},
                },
              })
              opts.pickers = {
                diagnostics = {
                  theme = "ivy",
                  initial_mode = "normal",
                  layout_config = { preview_cutoff = 9999 },
                },
              }
              opts.extensions = {
                file_browser = {
                  theme = "dropdown",
                  -- disables netw and uses telescope-file-browser in its place
                  hijack_netrw = true,
                  mappings = {
                    ["n"] = {
                      -- custom normal mode mappings
                      ["N"] = fb_actions.create,
                      ["n"] = fb_actions.goto_parent_dir,
                      ["/"] = function()
                        vim.cmd("startinsert")
                      end,
                      ["<C-u>"] = function(prompt_bufnr)
                        for i = 1, 10 do
                          actions.move_selection_previous(prompt_bufnr)
                        end
                      end,
                      ["<C-d>"] = function(prompt_bufnr)
                        for i = 1, 10 do
                          actions.move_selection_next(prompt_bufnr)
                        end
                      end,
                      ["<PageUp>"] = actions.preview_scrolling_up,
                      ["<PageDown>"] = actions.preview_scrolling_down,
                    },
                  },
                },
              }
              telescope.setup(opts)
              require("telescope").load_extension("fzf")
              require("telescope").load_extension("file_browser")
            end,
          }
        '';
      };
      nvimPluginsExample = {
        text = ''
          -- since this is just an example spec, don't actually load anything here and return an empty spec
          -- stylua: ignore
          if true then return {} end

          -- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
          --
          -- In your plugin files, you can:
          -- * add extra plugins
          -- * disable/enabled LazyVim plugins
          -- * override the configuration of LazyVim plugins
          return {
            -- add gruvbox
            { "ellisonleao/gruvbox.nvim" },

            -- Configure LazyVim to load gruvbox
            {
              "LazyVim/LazyVim",
              opts = {
                colorscheme = "gruvbox",
              },
            },

            -- change trouble config
            {
              "folke/trouble.nvim",
              -- opts will be merged with the parent spec
              opts = { use_diagnostic_signs = true },
            },

            -- disable trouble
            { "folke/trouble.nvim", enabled = false },

            -- add symbols-outline
            {
              "simrat39/symbols-outline.nvim",
              cmd = "SymbolsOutline",
              keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
              config = true,
            },

            -- override nvim-cmp and add cmp-emoji
            {
              "hrsh7th/nvim-cmp",
              dependencies = { "hrsh7th/cmp-emoji" },
              ---@param opts cmp.ConfigSchema
              opts = function(_, opts)
                table.insert(opts.sources, { name = "emoji" })
              end,
            },

            -- change some telescope options and a keymap to browse plugin files
            {
              "nvim-telescope/telescope.nvim",
              keys = {
                -- add a keymap to browse plugin files
                -- stylua: ignore
                {
                  "<leader>fp",
                  function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
                  desc = "Find Plugin File",
                },
              },
              -- change some options
              opts = {
                defaults = {
                  layout_strategy = "horizontal",
                  layout_config = { prompt_position = "top" },
                  sorting_strategy = "ascending",
                  winblend = 0,
                },
              },
            },

            -- add telescope-fzf-native
            {
              "telescope.nvim",
              dependencies = {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                  require("telescope").load_extension("fzf")
                end,
              },
            },

            -- add pyright to lspconfig
            {
              "neovim/nvim-lspconfig",
              ---@class PluginLspOpts
              opts = {
                ---@type lspconfig.options
                servers = {
                  -- pyright will be automatically installed with mason and loaded with lspconfig
                  pyright = {},
                },
              },
            },

            -- add tsserver and setup with typescript.nvim instead of lspconfig
            {
              "neovim/nvim-lspconfig",
              dependencies = {
                "jose-elias-alvarez/typescript.nvim",
                init = function()
                  require("lazyvim.util").lsp.on_attach(function(_, buffer)
                    -- stylua: ignore
                    vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
                  end)
                end,
              },
              ---@class PluginLspOpts
              opts = {
                ---@type lspconfig.options
                servers = {
                  -- tsserver will be automatically installed with mason and loaded with lspconfig
                  tsserver = {},
                },
                -- you can do any additional lsp server setup here
                -- return true if you don't want this server to be setup with lspconfig
                ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
                setup = {
                  -- example to setup with typescript.nvim
                  tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                  end,
                  -- Specify * to use this function as a fallback for any server
                  -- ["*"] = function(server, opts) end,
                },
              },
            },

            -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
            -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
            { import = "lazyvim.plugins.extras.lang.typescript" },

            -- add more treesitter parsers
            {
              "nvim-treesitter/nvim-treesitter",
              opts = {
                ensure_installed = {
                  "bash",
                  "html",
                  "javascript",
                  "json",
                  "lua",
                  "markdown",
                  "markdown_inline",
                  "python",
                  "query",
                  "regex",
                  "tsx",
                  "typescript",
                  "vim",
                  "yaml",
                },
              },
            },

            -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
            -- would overwrite `ensure_installed` with the new value.
            -- If you'd rather extend the default config, use the code below instead:
            {
              "nvim-treesitter/nvim-treesitter",
              opts = function(_, opts)
                -- add tsx and treesitter
                vim.list_extend(opts.ensure_installed, {
                  "tsx",
                  "typescript",
                })
              end,
            },

            -- the opts function can also be used to change the default opts:
            {
              "nvim-lualine/lualine.nvim",
              event = "VeryLazy",
              opts = function(_, opts)
                table.insert(opts.sections.lualine_x, "😄")
              end,
            },

            -- or you can return new options to override all the defaults
            {
              "nvim-lualine/lualine.nvim",
              event = "VeryLazy",
              opts = function()
                return {
                  --[[add your custom lualine config here]]
                }
              end,
            },

            -- use mini.starter instead of alpha
            { import = "lazyvim.plugins.extras.ui.mini-starter" },

            -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
            { import = "lazyvim.plugins.extras.lang.json" },

            -- add any tools you want to have installed below
            {
              "williamboman/mason.nvim",
              opts = {
                ensure_installed = {
                  "stylua",
                  "shellcheck",
                  "shfmt",
                  "flake8",
                },
              },
            },

            -- Use <tab> for completion and snippets (supertab)
            -- first: disable default <tab> and <s-tab> behavior in LuaSnip
            {
              "L3MON4D3/LuaSnip",
              keys = function()
                return {}
              end,
            },
            -- then: setup supertab in cmp
            {
              "hrsh7th/nvim-cmp",
              dependencies = {
                "hrsh7th/cmp-emoji",
              },
              ---@param opts cmp.ConfigSchema
              opts = function(_, opts)
                local has_words_before = function()
                  unpack = unpack or table.unpack
                  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                end

                local luasnip = require("luasnip")
                local cmp = require("cmp")

                opts.mapping = vim.tbl_extend("force", opts.mapping, {
                  ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_next_item()
                      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                      -- this way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                      luasnip.expand_or_jump()
                    elseif has_words_before() then
                      cmp.complete()
                    else
                      fallback()
                    end
                  end, { "i", "s" }),
                  ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                      luasnip.jump(-1)
                    else
                      fallback()
                    end
                  end, { "i", "s" }),
                })
              end,
            },
          }
        '';
      };
      nvimPluginsLsp = {
        target = ".config/nvim/lua/plugins/lsp.lua";
        text = ''
          return {
            -- tools
            {
              "williamboman/mason.nvim",
              opts = function(_, opts)
                vim.list_extend(opts.ensure_installed, {
                  "stylua",
                  "selene",
                  "luacheck",
                  "shellcheck",
                  "shfmt",
                  "tailwindcss-language-server",
                  "typescript-language-server",
                  "css-lsp",
                })
              end,
            },

            -- lsp servers
            {
              "neovim/nvim-lspconfig",
              opts = {
                inlay_hints = { enabled = false },
                ---@type lspconfig.options
                servers = {
                  cssls = {},
                  tailwindcss = {
                    root_dir = function(...)
                      return require("lspconfig.util").root_pattern(".git")(...)
                    end,
                  },
                  tsserver = {
                    root_dir = function(...)
                      return require("lspconfig.util").root_pattern(".git")(...)
                    end,
                    single_file_support = false,
                    settings = {
                      typescript = {
                        inlayHints = {
                          includeInlayParameterNameHints = "literal",
                          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                          includeInlayFunctionParameterTypeHints = true,
                          includeInlayVariableTypeHints = false,
                          includeInlayPropertyDeclarationTypeHints = true,
                          includeInlayFunctionLikeReturnTypeHints = true,
                          includeInlayEnumMemberValueHints = true,
                        },
                      },
                      javascript = {
                        inlayHints = {
                          includeInlayParameterNameHints = "all",
                          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                          includeInlayFunctionParameterTypeHints = true,
                          includeInlayVariableTypeHints = true,
                          includeInlayPropertyDeclarationTypeHints = true,
                          includeInlayFunctionLikeReturnTypeHints = true,
                          includeInlayEnumMemberValueHints = true,
                        },
                      },
                    },
                  },
                  html = {},
                  yamlls = {
                    settings = {
                      yaml = {
                        keyOrdering = false,
                      },
                    },
                  },
                  lua_ls = {
                    -- enabled = false,
                    single_file_support = true,
                    settings = {
                      Lua = {
                        workspace = {
                          checkThirdParty = false,
                        },
                        completion = {
                          workspaceWord = true,
                          callSnippet = "Both",
                        },
                        misc = {
                          parameters = {
                            -- "--log-level=trace",
                          },
                        },
                        hint = {
                          enable = true,
                          setType = false,
                          paramType = true,
                          paramName = "Disable",
                          semicolon = "Disable",
                          arrayIndex = "Disable",
                        },
                        doc = {
                          privateName = { "^_" },
                        },
                        type = {
                          castNumberToInteger = true,
                        },
                        diagnostics = {
                          disable = { "incomplete-signature-doc", "trailing-space" },
                          -- enable = false,
                          groupSeverity = {
                            strong = "Warning",
                            strict = "Warning",
                          },
                          groupFileStatus = {
                            ["ambiguity"] = "Opened",
                            ["await"] = "Opened",
                            ["codestyle"] = "None",
                            ["duplicate"] = "Opened",
                            ["global"] = "Opened",
                            ["luadoc"] = "Opened",
                            ["redefined"] = "Opened",
                            ["strict"] = "Opened",
                            ["strong"] = "Opened",
                            ["type-check"] = "Opened",
                            ["unbalanced"] = "Opened",
                            ["unused"] = "Opened",
                          },
                          unusedLocalExclude = { "_*" },
                        },
                        format = {
                          enable = false,
                          defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                            continuation_indent_size = "2",
                          },
                        },
                      },
                    },
                  },
                },
                setup = {},
              },
            },
          }
        '';
      }; 
      nvimPluginsTreesitter = {
        target = ".config/nvim/lua/plugins/treesitter.lua";
        text = ''
          return {
            { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

            {
              "nvim-treesitter/nvim-treesitter",
              opts = {
                ensure_installed = {
                  "astro",
                  "cmake",
                  "cpp",
                  "css",
                  "fish",
                  "gitignore",
                  "go",
                  "graphql",
                  "http",
                  "java",
                  "php",
                  "rust",
                  "scss",
                  "sql",
                  "svelte",
                },

                -- matchup = {
                -- 	enable = true,
                -- },

                -- https://github.com/nvim-treesitter/playground#query-linter
                query_linter = {
                  enable = true,
                  use_virtual_text = true,
                  lint_events = { "BufWrite", "CursorHold" },
                },

                playground = {
                  enable = true,
                  disable = {},
                  updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                  persist_queries = true, -- Whether the query persists across vim sessions
                  keybindings = {
                    toggle_query_editor = "o",
                    toggle_hl_groups = "i",
                    toggle_injected_languages = "t",
                    toggle_anonymous_nodes = "a",
                    toggle_language_display = "I",
                    focus_language = "f",
                    unfocus_language = "F",
                    update = "R",
                    goto_node = "<cr>",
                    show_help = "?",
                  },
                },
              },
              config = function(_, opts)
                require("nvim-treesitter.configs").setup(opts)

                -- MDX
                vim.filetype.add({
                  extension = {
                    mdx = "mdx",
                  },
                })
                vim.treesitter.language.register("markdown", "mdx")
              end,
            },
          }
        '';
      }; 
      nvimPluginsUi = {
        target = ".config/nvim/lua/plugins/ui.lua";
        text = ''
          return {
            -- messages, cmdline and the popupmenu
            {
              "folke/noice.nvim",
              opts = function(_, opts)
                table.insert(opts.routes, {
                  filter = {
                    event = "notify",
                    find = "No information available",
                  },
                  opts = { skip = true },
                })
                local focused = true
                vim.api.nvim_create_autocmd("FocusGained", {
                  callback = function()
                    focused = true
                  end,
                })
                vim.api.nvim_create_autocmd("FocusLost", {
                  callback = function()
                    focused = false
                  end,
                })
                table.insert(opts.routes, 1, {
                  filter = {
                    cond = function()
                      return not focused
                    end,
                  },
                  view = "notify_send",
                  opts = { stop = false },
                })

                opts.commands = {
                  all = {
                    -- options for the message history that you get with `:Noice`
                    view = "split",
                    opts = { enter = true, format = "details" },
                    filter = {},
                  },
                }

                vim.api.nvim_create_autocmd("FileType", {
                  pattern = "markdown",
                  callback = function(event)
                    vim.schedule(function()
                      require("noice.text.markdown").keys(event.buf)
                    end)
                  end,
                })

                opts.presets.lsp_doc_border = true
              end,
            },

            {
              "rcarriga/nvim-notify",
              opts = {
                timeout = 5000,
              },
            },

            -- animations
            {
              "echasnovski/mini.animate",
              event = "VeryLazy",
              opts = function(_, opts)
                opts.scroll = {
                  enable = false,
                }
              end,
            },

            -- buffer line
            {
              "akinsho/bufferline.nvim",
              event = "VeryLazy",
              keys = {
                { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
                { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
              },
              opts = {
                options = {
                  mode = "tabs",
                  -- separator_style = "slant",
                  show_buffer_close_icons = false,
                  show_close_icon = false,
                },
              },
            },

            -- statusline
            {
              "nvim-lualine/lualine.nvim",
              event = "VeryLazy",
              opts = {
                options = {
                  -- globalstatus = false,
                  theme = "solarized_dark",
                },
              },
            },

            -- filename
            {
              "b0o/incline.nvim",
              dependencies = { "craftzdog/solarized-osaka.nvim" },
              event = "BufReadPre",
              priority = 1200,
              config = function()
                local colors = require("solarized-osaka.colors").setup()
                require("incline").setup({
                  highlight = {
                    groups = {
                      InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
                      InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
                    },
                  },
                  window = { margin = { vertical = 0, horizontal = 1 } },
                  hide = {
                    cursorline = true,
                  },
                  render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if vim.bo[props.buf].modified then
                      filename = "[+] " .. filename
                    end

                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    return { { icon, guifg = color }, { " " }, { filename } }
                  end,
                })
              end,
            },

            {
              "folke/zen-mode.nvim",
              cmd = "ZenMode",
              opts = {
                plugins = {
                  gitsigns = true,
                  tmux = true,
                  kitty = { enabled = false, font = "+2" },
                },
              },
              keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
            },

            {
              "nvimdev/dashboard-nvim",
              event = "VimEnter",
              opts = function(_, opts)
                local logo = [[
           ▄▄▄▄    ██░ ██  ██▓ ███▄ ▄███▓
          ▓█████▄ ▓██░ ██▒▓██▒▓██▒▀█▀ ██▒
          ▒██▒ ▄██▒██▀▀██░▒██▒▓██    ▓██░
          ▒██░█▀  ░▓█ ░██ ░██░▒██    ▒██ 
          ░▓█  ▀█▓░▓█▒░██▓░██░▒██▒   ░██▒
          ░▒▓███▀▒ ▒ ░░▒░▒░▓  ░ ▒░   ░  ░
          ▒░▒   ░  ▒ ░▒░ ░ ▒ ░░  ░      ░
           ░    ░  ░  ░░ ░ ▒ ░░      ░   
           ░       ░  ░  ░ ░         ░   
                ░                        
                ]]

                logo = string.rep("\n", 8) .. logo .. "\n\n"
                opts.config.header = vim.split(logo, "\n")
              end,
            },
          }
        '';
      }; 

      nvimInitLua = {
        target = ".config/nvim/init.lua";
        text = ''
          require("config.lazy")
        '';
      };
      nvimUseNode = {
        target = ".config/nvim/shell.nix";
        text = ''
          {pkgs ? import <nixpkgs> {}}:
          pkgs.mkShell {
            buildInputs = [
              pkgs.nodejs_18
              pkgs.unzip
              pkgs.luarocks
            ];
          }
        '';
      };
      nvimStyleUa = {
        target = ".config/nvim/stylua.toml";
        text = ''
          indent_type = "Spaces"
          indent_width = 2
          column_width = 120
        '';
      };
    };
  };
}