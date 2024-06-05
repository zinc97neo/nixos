{
  name = "html";
  scope = "text.html.basic";
  injection-regex = "html";
  file-types = [ "html" "htm" "shtml" "xhtml" "xht" "jsp" "asp" "aspx" "jshtm" "volt" "rhtml" ];
  block-comment-tokens = { start = "<!--"; end = "-->"; };
  language-servers = [ "vscode-html-language-server" ];
  auto-format = true;
  indent = {
    tab-width = 2;
    unit = "  ";
  };
}
