{
  name = "jsonc";
  scope = "source.json";
  injection-regex = "jsonc";
  file-types = [ "jsonc" ];
  grammar = "json";
  language-servers = [ "vscode-json-language-server" ];
  auto-format = true;
  indent = {
    tab-width = 2;
    unit = "  ";
  };
}
