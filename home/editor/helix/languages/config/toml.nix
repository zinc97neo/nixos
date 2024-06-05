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
