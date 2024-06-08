{
  name = "kdl";
  scope = "source.kdl";
  file-types = [ "kdl" ];
  comment-token = "//";
  block-comment-tokens = { start = "/*"; end = "*/"; };
  auto-format = false;
  # formatter = {
  #   command = "nixpkgs-fmt";
  # };
  injection-regex = "kdl";
}
