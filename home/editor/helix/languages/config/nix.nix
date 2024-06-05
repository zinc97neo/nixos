{
  name = "nix";
  auto-format = true;
  scope = "source.nix";
  injection-regex = "nix";
  file-types = [ "nix" ];
  shebangs = [ ];
  comment-token = "#";
  formatter = {
    command = "nixpkgs-fmt";
  };
  language-servers = [ "nil" "codeium" ];
  indent = { tab-width = 2; unit = "  "; };
}
