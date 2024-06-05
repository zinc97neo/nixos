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
