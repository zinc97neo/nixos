{
  name = "javascript";
  scope = "source.js";
  injection-regex = "(js|javascript)";
  language-id = "javascript";
  file-types = [
    "js"
    "mjs"
    "cjs"
    "rules"
    "es6"
    "pac"
    {
      glob = ".node_repl_history";
    }
    { glob = "jakefile"; }
  ];
  auto-format = true;
  shebangs = [ "node" ];
  comment-token = "//";
  block-comment-tokens = {
    start = "/*";
    end = "*/";
  };
  language-servers = [ "typescript-language-server" "codeium" ];
  indent = { tab-width = 2; unit = "  "; };
}
