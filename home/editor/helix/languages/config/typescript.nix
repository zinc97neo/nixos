{
  name = "typescript";
  scope = "source.ts";
  injection-regex = "(ts|typescript)";
  language-id = "typescript";
  file-types = [ "ts" "mts" "cts" ];
  shebangs = [ "deno" "bun" "ts-node" ];
  comment-token = "//";
  block-comment-tokens = { start = "/*"; end = "*/"; };
  language-servers = [ "typescript-language-server" ];
  indent = { tab-width = 2; unit = "  "; };
}
