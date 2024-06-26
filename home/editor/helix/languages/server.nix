{ pkgs }: with pkgs; {
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
  typescript-language-server = {
    command = "${nodePackages_latest.typescript-language-server}/bin/typescript-language-server";
    ags = [ "--stdio" ];
    config = {
      hostInfo = "helix";
      typescript.inlayHints = {
        includeInlayEnumMemberValueHints = true;
        includeInlayFunctionLikeReturnTypeHints = true;
        includeInlayFunctionParameterTypeHints = true;
        includeInlayParameterNameHints = "all";
        includeInlayParameterNameHintsWhenArgumentMatchesName = true;
        includeInlayPropertyDeclarationTypeHints = true;
        includeInlayVariableTypeHints = true;
      };
      javascript.inlayHints = {
        includeInlayEnumMemberValueHints = true;
        includeInlayFunctionLikeReturnTypeHints = true;
        includeInlayFunctionParameterTypeHints = true;
        includeInlayParameterNameHints = "all";
        includeInlayParameterNameHintsWhenArgumentMatchesName = true;
        includeInlayPropertyDeclarationTypeHints = true;
        includeInlayVariableTypeHints = true;
      };
    };
  };
  vscode-html-language-server = {
    command = "${vscode-langservers-extracted}/bin/vscode-html-language-server";
    args = [ "--stdio" ];
    config = { provideFormatter = true; };
  };
  vscode-css-language-server = {
    command = "${vscode-langservers-extracted}/bin/vscode-css-language-server";
    args = [ "--stdio" ];
    config = {
      provideFormatter = true;
      css = {
        validate = { enable = true; };
      };
    };
  };
  vscode-json-language-server = {
    command = "${vscode-langservers-extracted}/bin/vscode-json-language-server";
    args = [ "--stdio" ];
    config = {
      provideFormatter = true;
      json = {
        validate = { enable = true; };
      };
    };
  };
}
