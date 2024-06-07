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
        vim.o.guifont = "Maple Mono SC NF:h16"
        vim.cmd([[
          set background=light
          let g:everforest_background = 'soft'
          colorscheme everforest
        ]])
      end
    '';
  };
}
