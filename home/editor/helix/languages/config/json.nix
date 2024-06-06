{
  name = "json";
  scope = "source.json";
  injection-regex = "json";
  file-types = [
    "json"
    "arb"
    "ipynb"
    "geojson"
    "gltf"
    "webmanifest"
    { glob = "flake.lock"; }
    { glob = ".babelrc"; }
    { glob = ".bowerrc"; }
    { glob = ".jscrc"; }
    "js.map"
    "ts.map"
    "css.map"
    { glob = ".jslintrc"; }
    "jsonld"
    { glob = ".vuerc"; }
    { glob = "composer.lock"; }
    { glob = ".watchmanconfig"; }
    "avsc"
    { glob = ".prettierrc"; }
  ];
  language-servers = [ "vscode-json-language-server" ];
  auto-format = true;
  indent = { tab-width = 2; unit = "  "; };
}
