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
