{
  config,
  pkgs,
  ...
}: {
  config = {
    programs = {
      vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          alexdima.copy-relative-path
          astro-build.astro-vscode
          b4dm4n.vscode-nixpkgs-fmt
          bbenoist.nix
          bierner.docs-view
          bierner.emojisense
          bierner.markdown-checkbox
          bierner.markdown-emoji
          bierner.markdown-mermaid
          bmalehorn.vscode-fish
          bmewburn.vscode-intelephense-client
          bradlc.vscode-tailwindcss
          christian-kohler.npm-intellisense
          christian-kohler.path-intellisense
          colejcummins.llvm-syntax-highlighting
          contextmapper.context-mapper-vscode-extension
          coolbear.systemd-unit-file
          cweijan.vscode-database-client2
          dart-code.dart-code
          dart-code.flutter
          davidanson.vscode-markdownlint
          dbaeumer.vscode-eslint
          denoland.vscode-deno
          devsense.composer-php-vscode
          devsense.phptools-vscode
          devsense.profiler-php-vscode
          dhall.dhall-lang
          dhall.vscode-dhall-lsp-server
          dhedgecock.radical-vscode
          disneystreaming.smithy
          donjayamanne.githistory
          dotjoshjohnson.xml
          earthly.earthfile-syntax-highlighting
          ecmel.vscode-html-css
          editorconfig.editorconfig
          elmtooling.elm-ls-vscode
          esbenp.prettier-vscode
          firsttris.vscode-jest-runner
          foam.foam-vscode
          formulahendry.auto-close-tag
          formulahendry.auto-rename-tag
          formulahendry.code-runner
          gencer.html-slim-scss-css-class-completion
          github.codespaces
          github.copilot
          github.copilot-chat
          github.github-vscode-theme
          github.vscode-github-actions
          github.vscode-pull-request-github
          golang.go
          grapecity.gc-excelviewer
          graphql.vscode-graphql
          graphql.vscode-graphql-syntax
          gruntfuggly.todo-tree
          hars.cppsnippets
          haskell.haskell
          hbenl.vscode-test-explorer
          hediet.vscode-drawio
          ibm.output-colorizer
          iciclesoft.workspacesort
          intellsmi.comment-translate
          ionide.ionide-fsharp
          irongeek.vscode-env
          james-yu.latex-workshop
          jdinhlife.gruvbox
          jebbs.plantuml
          jnoortheen.nix-ide
          jock.svg
          johnpapa.vscode-peacock
          julialang.language-julia
          justusadam.language-haskell
          kamikillerto.vscode-colorize
          kamadorueda.alejandra
          llvm-vs-code-extensions.vscode-clangd
          lokalise.i18n-ally
          matangover.mypy
          mathiasfrohlich.kotlin
          mattn.lisp
          marp-team.marp-vscode
          mechatroner.rainbow-csv
          mgt19937.typst-preview
          mhutchie.git-graph
          mikestead.dotenv
          mishkinf.goto-next-previous-member
          mkhl.direnv
          moshfeu.compare-folders
          ms-azuretools.vscode-docker
          ms-dotnettools.csdevkit
          ms-dotnettools.csharp
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
          ms-vscode.anycode
          ms-vscode.cmake-tools
          ms-vscode.cpptools
          ms-vscode.cpptools-extension-pack
          ms-vscode.hexeditor
          ms-vscode.live-server
          ms-vscode.makefile-tools
          ms-vscode.powershell
          ms-vscode.test-adapter-converter
          ms-vscode.theme-tomorrowkit
          ms-vsliveshare.vsliveshare
          mvllow.rose-pine
          njpwerner.autodocstring
          nvarner.typst-lsp
          ocamllabs.ocaml-platform
          quicktype.quicktype
          pkief.material-icon-theme
          pkief.material-product-icons
          pythagoratechnologies.gpt-pilot-vs-code
          redhat.ansible
          redhat.java
          redhat.vscode-xml
          redhat.vscode-yaml
          reditorsupport.r
          richie5um2.snake-trail
          ritwickdey.liveserver
          ryu1kn.partial-diff
          rubbersheep.gi
          rust-lang.rust-analyzer
          sanaajani.taskrunnercode
          scala-lang.scala
          scalameta.metals
          seatonjiang.gitmoji-vscode
          serayuzgur.crates
          shd101wyy.markdown-preview-enhanced
          shopify.ruby-lsp
          skellock.just
          skyapps.fish-vscode
          spywhere.guides
          stkb.rewrap
          styled-components.vscode-styled-components
          sumneko.lua
          supermaven.supermaven
          svelte.svelte-vscode
          svsool.markdown-memo
          tamasfe.even-better-toml
          thenuprojectcontributors.vscode-nushell-lang
          tim-koehler.helm-intellisense
          timonwong.shellcheck
          tomoki1207.pdf
          twxs.cmake
          unifiedjs.vscode-mdx
          usernamehw.errorlens
          vadimcn.vscode-lldb
          vincaslt.highlight-matching-tag
          visualstudioexptteam.intellicode-api-usage-examples
          visualstudioexptteam.vscodeintellicode
          vlanguage.vscode-vlang
          vscjava.vscode-gradle
          vscjava.vscode-java-debug
          vscjava.vscode-java-dependency
          vscjava.vscode-java-pack
          vscjava.vscode-java-test
          vscjava.vscode-maven
          vscjava.vscode-spring-initializr
          vscode-icons-team.vscode-icons
          waderyan.gitblame
          wix.vscode-import-cost
          wmaurer.change-case
          xaver.clang-format
          yzhang.dictionary-completion
          yzhang.markdown-all-in-one
          zainchen.json
          zhwu95.riscv
          zxh404.vscode-proto3
        ];
        userSettings = {
          "diffEditor.codeLens" = true;
          "editor.detectIndentation" = true;
          "editor.fontFamily" = "'VictorMono Nerd Font Propo', 'monospace', monospace";
          "editor.inlineSuggest.enabled" = true;
          "editor.suggestSelection" = "first";
          "editor.tabSize" = 2;
          "editor.wordWrap" = "on";
          "files.autoSave" = "afterDelay";
          "git.autofetch" = true;
          "git.confirmSync" = false;
          "git.enableSmartCommit" = true;
          "terminal.integrated.fontFamily" = "RobotoMono Nerd Font Propo";
          "workbench.iconTheme" = "vscode-icons";
          "markdown-preview-enhanced.revealjsTheme" = "night.css";
          "markdown-preview-enhanced.previewTheme" = "night.css";
        };
      };
    };
  };
}
