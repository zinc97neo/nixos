{
  name = "scss";
  scope = "source.scss";
  injection-regex = "scss";
  file-types = [ "scss" ];
  block-comment-tokens = { start = "/*"; end = "*/"; };
  language-servers = [ "vscode-css-language-server" ];
  auto-format = true;
  indent = { tab-width = 2; unit = "  "; };
}
