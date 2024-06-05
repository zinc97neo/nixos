{
  name = "css";
  scope = "source.css";
  injection-regex = "css";
  file-types = [ "css" "scss" ];
  block-comment-tokens = {
    start = "/*";
    end = "*/";
  };
  language-servers = [ "vscode-css-language-server" ];
  auto-format = true;
  indent = { tab-width = 2; unit = "  "; };
}
