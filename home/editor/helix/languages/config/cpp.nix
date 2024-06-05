{
  name = "cpp";
  scope = "source.cpp";
  injection-regex = "cpp";
  file-types = [ "cc" "hh" "c++" "cpp" "hpp" "h" "ipp" "tpp" "cxx" "hxx" "ixx" "txx" "ino" "C" "H" "cu" "cuh" "cppm" "h++" "ii" ];
  comment-token = "//";
  auto-format = true;
  block-comment-tokens = [{ start = "/*"; end = "*/"; }];
  language-servers = [ "clangd" "codeium" ];
  indent = { tab-width = 2; unit = "  "; };
}
