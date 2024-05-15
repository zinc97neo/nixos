{ pkgs, ... }:
{
  xdg.configFile."helix/themes" = {
    source = ./themes;
    recursive = true;
  };
  programs.helix = {
    enable = true;
    settings = {
      theme = "custom_dark";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        gutters = [ "diff" "diagnostics" "line-numbers" "spacer" ];
        idle-timeout = 100;
        auto-save = true;
        mouse = false;
        indent-guides.render = true;
        cursorline = true;
        true-color = true;
        color-modes = true;
        soft-wrap.enable = true;
        popup-border = "none";
        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };
        cursor-shape = {
          normal = "block";
          insert = "block";
          select = "block";
        };
      };

      keys.normal = {
        C-a = ":wa";
        C-q = ":wq";
        C-f = ":fmt";
        space."." = "file_picker";
        space."," = "buffer_picker";
        C-l = "delete_selection_noyank";
        S-h = ":bp";
        S-l = ":bn";
      };

      keys.insert = {
        j.j = "normal_mode";
      };
    };

    languages = {
      language = [
        {
          name = "rust";
          scope = "source.rust";
          injection-regex = "rust";
          file-types = [ "rs" ];
          roots = [ "Cargo.toml" "Cargo.lock" ];
          shebangs = [ "rust-script" "cargo" ];
          auto-format = true;
          comment-tokens = [ "//" "///" "//!" ];
          block-comment-tokens = [
            { start = "/*"; end = "*/"; }
            { start = "/**"; end = "*/"; }
            { start = "/*!"; end = "*/"; }
          ];
          language-servers = [ "rust-analyzer" "codeium" ];
          indent = { tab-width = 4; unit = "    "; };
          persistent-diagnostic-sources = [ "rustc" "clippy" ];
        }
        {
          name = "c";
          scope = "source.c";
          injection-regex = "c";
          file-types = [ "c" ];
          comment-token = "//";
          auto-format = true;
          block-comment-tokens = [{ start = "/*"; end = "*/"; }];
          language-servers = [ "clangd" "codeium" ];
          indent = { tab-width = 2; unit = "  "; };
        }
        {
          name = "cpp";
          scope = "source.cpp";
          injection-regex = "cpp";
          file-types = [ "cc" "hh" "c++" "cpp" "hpp" "h" "ipp" "tpp" "cxx" "hxx" "ixx" "txx" "ino" "C" "H" "cu" "cuh" "cppm" "h++" "ii" ];
          comment-token = "//";
          auto-format = true;
          block-comment-tokens = [{ start = "/*"; end = "*/"; }];
          language-servers = [ "clangd" "codeium" ];
          indent = { tab-width = 2; unit = "  "; };
        }
        {
          name = "nix";
          auto-format = true;
          scope = "source.nix";
          injection-regex = "nix";
          file-types = [ "nix" ];
          shebangs = [ ];
          comment-token = "#";
          formatter = {
            command = "nixpkgs-fmt";
          };
          language-servers = [ "nil" "codeium" ];
          indent = { tab-width = 2; unit = "  "; };
        }
        {
          name = "toml";
          auto-format = true;
          scope = "source.toml";
          injection-regex = "toml";
          file-types = [ "toml" { glob = "poetry.lock"; } { glob = "Cargo.lock"; } ];
          comment-token = "#";
          language-servers = [ "taplo" ];
          indent = { tab-width = 2; unit = "  "; };
        }
        {
          name = "kdl";
          scope = "source.kdl";
          file-types = [ "kdl" ];
          comment-token = "//";
          block-comment-tokens = { start = "/*"; end = "*/"; };
          injection-regex = "kdl";
        }
      ];
      language-server = with pkgs; {
        rust-analyzer.config.inlayHints = {
          bindingModeHints.enable = true;
          closingBraceHints.minLines = 10;
          closureReturnTypeHints.enable = "with_block";
          discriminantHints.enable = "fieldless";
          lifetimeElisionHints.enable = "skip_trivial";
          typeHints.hideClosureInitialization = false;
        };
        clangd = {
          command = "clangd";
        };
        nil = {
          command = "nil";
        };
        codeium = {
          command = "${helix-gpt}/bin/helix-gpt";
          args = [ "--handler" "codeium" ];
        };
        taplo = {
          command = "taplo";
          args = [ "lsp" "stdio" ];
        };
      };
      grammer = [
        {
          name = "rust";
          source = { git = "https://github.com/tree-sitter/tree-sitter-rust"; rev = "473634230435c18033384bebaa6d6a17c2523281"; };
        }
        {
          name = "c";
          source = { git = "https://github.com/tree-sitter/tree-sitter-c"; rev = "7175a6dd5fc1cee660dce6fe23f6043d75af424a"; };
        }
        {
          name = "cpp";
          source = { git = "https://github.com/tree-sitter/tree-sitter-cpp"; rev = "670404d7c689be1c868a46f919ba2a3912f2b7ef"; };
        }
        {
          name = "nix";
          source = { git = "https://github.com/nix-community/tree-sitter-nix"; rev = "1b69cf1fa92366eefbe6863c184e5d2ece5f187d"; };
        }
        {
          name = "toml";
          source = { git = "https://github.com/ikatyang/tree-sitter-toml"; rev = "7cff70bbcbbc62001b465603ca1ea88edd668704"; };
        }
        {
          name = "kdl";
          source = { git = "https://github.com/amaanq/tree-sitter-kdl"; rev = "3ca569b9f9af43593c24f9e7a21f02f43a13bb88"; };
        }
      ];
    };
  };
}
