{
  name = "kdl";
  scope = "source.kdl";
  file-types = [ "kdl" ];
  comment-token = "//";
  block-comment-tokens = { start = "/*"; end = "*/"; };
  auto-format = true;
  formatter = {
    command = "nixpkgs-fmt";
  };
  injection-regex = "kdl";
}
