{
  user,
  specialArgs,
  options,
  modulesPath,
  lib,
  pkgs,
  config,
  nixosConfig,
  osConfig,
  _class, # musnix?
}: {
  config = {
    programs = {
      vscode = {
        enable = true;
        profiles.default = {
          extensions = with pkgs.vscode-extensions; [
            alexdima.copy-relative-path
            apollographql.vscode-apollo # DB
            b4dm4n.vscode-nixpkgs-fmt # LSP
            bbenoist.nix # LSP
            bierner.comment-tagged-templates # LSP
            bierner.docs-view # LSP
            bierner.emojisense # LSP
            bierner.github-markdown-preview # LSP
            bierner.markdown-checkbox # LSP
            bierner.markdown-emoji # LSP
            bierner.markdown-footnotes # LSP
            bierner.markdown-mermaid # LSP
            bierner.markdown-preview-github-styles # LSP
            bmalehorn.vscode-fish # LSP
            bmewburn.vscode-intelephense-client # LSP
            bradlc.vscode-tailwindcss # LSP
            christian-kohler.npm-intellisense # LSP
            christian-kohler.path-intellisense # LSP
            codezombiech.gitignore
            colejcummins.llvm-syntax-highlighting # LSP
            contextmapper.context-mapper-vscode-extension # LSP
            csharpier.csharpier-vscode # LSP
            cweijan.vscode-database-client2 # DB
            davidanson.vscode-markdownlint # LSP
            dbaeumer.vscode-eslint # LSP
            devsense.composer-php-vscode # Package Manager
            devsense.phptools-vscode # Profiling
            devsense.profiler-php-vscode # Profiling
            donjayamanne.githistory # Git
            dotenv.dotenv-vscode # Shell
            dotjoshjohnson.xml # LSP
            ecmel.vscode-html-css # LSP
            editorconfig.editorconfig # LSP
            esbenp.prettier-vscode # LSP
            fabiospampinato.vscode-open-in-github # Utility
            fill-labs.dependi # Dependency Management
            firefox-devtools.vscode-firefox-debug # Utility
            firsttris.vscode-jest-runner # Tests
            foam.foam-vscode # Notes
            gencer.html-slim-scss-css-class-completion
            github.github-vscode-theme
            github.vscode-github-actions
            github.vscode-pull-request-github
            golang.go # LSP
            graphql.vscode-graphql # API
            graphql.vscode-graphql-syntax # LSP
            hars.cppsnippets
            hbenl.vscode-test-explorer
            hediet.vscode-drawio
            ibm.output-colorizer # Debug
            irongeek.vscode-env
            james-yu.latex-workshop # LaTeX
            jeff-hykin.better-nix-syntax # LSP
            jgclark.vscode-todo-highlight
            jnoortheen.nix-ide # LSP
            jock.svg
            johnpapa.vscode-peacock
            kamadorueda.alejandra
            kamikillerto.vscode-colorize
            llvm-vs-code-extensions.vscode-clangd
            lokalise.i18n-ally
            # matangover.mypy # Annoying message ALL THE TIME
            mechatroner.rainbow-csv
            mhutchie.git-graph
            mikestead.dotenv
            mishkinf.goto-next-previous-member
            mkhl.direnv
            moshfeu.compare-folders
            ms-azuretools.vscode-docker
            ms-dotnettools.csdevkit
            ms-dotnettools.csharp
            ms-dotnettools.vscode-dotnet-runtime
            ms-dotnettools.vscodeintellicode-csharp
            ms-kubernetes-tools.vscode-kubernetes-tools
            ms-pyright.pyright
            ms-python.black-formatter
            ms-python.debugpy
            ms-python.isort
            ms-python.python
            ms-python.vscode-pylance
            ms-toolsai.datawrangler
            ms-toolsai.jupyter
            ms-toolsai.jupyter-keymap
            ms-toolsai.jupyter-renderers
            ms-toolsai.vscode-jupyter-cell-tags
            ms-toolsai.vscode-jupyter-slideshow
            ms-vscode-remote.remote-containers
            ms-vscode-remote.remote-ssh
            ms-vscode-remote.remote-ssh-edit
            ms-vscode-remote.vscode-remote-extensionpack
            ms-vscode.anycode
            ms-vscode.cmake-tools
            ms-vscode.cpptools
            ms-vscode.cpptools-extension-pack
            ms-vscode.hexeditor
            ms-vscode.live-server
            ms-vscode.makefile-tools
            ms-vscode.test-adapter-converter
            ms-vsliveshare.vsliveshare
            njpwerner.autodocstring
            oderwat.indent-rainbow
            pkief.material-icon-theme
            pkief.material-product-icons
            pylyzer.pylyzer
            redhat.vscode-xml
            redhat.vscode-yaml
            reloadedextensions.reloaded-cpp
            richie5um2.snake-trail
            ritwickdey.liveserver
            ryu1kn.partial-diff
            rubbersheep.gi
            sanaajani.taskrunnercode
            seatonjiang.gitmoji-vscode
            shd101wyy.markdown-preview-enhanced
            stkb.rewrap
            styled-components.vscode-styled-components
            svelte.svelte-vscode
            svsool.markdown-memo
            tamasfe.even-better-toml
            tomoki1207.pdf
            unifiedjs.vscode-mdx
            usernamehw.errorlens
            vadimcn.vscode-lldb
            vincaslt.highlight-matching-tag
            visualstudioexptteam.intellicode-api-usage-examples
            visualstudioexptteam.vscodeintellicode
            vitaliymaz.vscode-svg-previewer
            vlanguage.vscode-vlang
            vscode-icons-team.vscode-icons
            waderyan.gitblame
            wix.vscode-import-cost
            wmaurer.change-case
            xaver.clang-format
            yzhang.dictionary-completion
            yzhang.markdown-all-in-one
            zainchen.json
            zxh404.vscode-proto3
          ];
          userSettings = {
            "[json]" = {
              "editor.defaultFormatter" = "vscode.json-language-features";
            };
            "[typescriptreact]" = {
              "editor.defaultFormatter" = "vscode.typescript-language-features";
            };
            "database-client.autoSync" = true;
            "diffEditor.codeLens" = true;
            "editor.detectIndentation" = true;
            "editor.fontFamily" = "'0xProto Nerd Font Mono', 'monospace', monospace";
            "editor.inlineSuggest.enabled" = true;
            "editor.suggestSelection" = "first";
            "editor.tabSize" = 2;
            "editor.wordWrap" = "on";
            "files.associations" = {
              "*.sqlbook" = "sql";
              "*.ndjson" = "jsonl";
              "*.dbclient-js" = "javascript";
              "*.embeddedhtml" = "html";
              ".fantomasignore" = "ignore";
              ".env*" = "dotenv";
            };
            "files.autoSave" = "afterDelay";
            "git.autofetch" = true;
            "git.confirmSync" = false;
            "git.enableSmartCommit" = true;
            "markdown-preview-enhanced.codeBlockTheme" = "solarized-dark.css";
            "markdown-preview-enhanced.previewTheme" = "solarized-dark.css";
            "markdown-preview-enhanced.revealjsTheme" = "night.css";
            "settingsSync.keybindingsPerPlatform" = false;
            "terminal.integrated.fontFamily" = "RobotoMono Nerd Font Propo";
            "workbench.activityBar.location" = "top";
            "workbench.colorTheme" = "Monokai";
            "workbench.iconTheme" = "vscode-icons";
          };
        };
        package = pkgs.vscode;
      };
    };
  };
}
