{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      everforest
    ];
    extraConfigLua = ''
      if vim.g.neovide then
        vim.g.neovide_cursor_animation_length = 0.12
        vim.cmd([[
          set background=light
          let g:everforest_background = 'soft'
          colorscheme everforest
        ]])
      end
    '';
  };
}
