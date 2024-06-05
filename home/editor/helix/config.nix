{
  theme = "custom_dark";
  editor = {
    line-number = "relative";
    bufferline = "multiple";
    gutters = [ "diff" "diagnostics" "line-numbers" "spacer" ];
    idle-timeout = 100;
    auto-save = true;
    mouse = false;
    indent-guides.render = true;
    cursorline = true;
    true-color = true;
    color-modes = true;
    soft-wrap.enable = true;
    popup-border = "none";
    lsp = {
      display-inlay-hints = true;
      display-messages = true;
    };
    cursor-shape = {
      normal = "block";
      insert = "block";
      select = "block";
    };
  };

  keys.normal = {
    C-a = ":wa";
    C-q = ":wq";
    C-f = ":fmt";
    space."." = "file_picker";
    space."," = "buffer_picker";
    C-l = "delete_selection_noyank";
    S-h = ":bp";
    S-l = ":bn";
  };

  keys.insert = {
    j.j = "normal_mode";
  };
}
