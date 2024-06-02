# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  librime-charcode = {
    pname = "librime-charcode";
    version = "55e7f563e999802d41a13ba02657c1be4b2011b4";
    src = fetchFromGitHub {
      owner = "rime";
      repo = "librime-charcode";
      rev = "55e7f563e999802d41a13ba02657c1be4b2011b4";
      fetchSubmodules = false;
      sha256 = "sha256-KfKkpph+2ChQpkkGKubmpg/18uPX9qUHTqJT1PSGorI=";
    };
    date = "2024-03-19";
  };
  librime-lua = {
    pname = "librime-lua";
    version = "7be6974b6d81c116bba39f6707dc640f6636fa4e";
    src = fetchFromGitHub {
      owner = "hchunhui";
      repo = "librime-lua";
      rev = "7be6974b6d81c116bba39f6707dc640f6636fa4e";
      fetchSubmodules = false;
      sha256 = "sha256-jsrnAFE99d0U0LdddTL7G1p416qJfSNR935TZFH3Swk=";
    };
    date = "2024-05-19";
  };
  librime-octagram = {
    pname = "librime-octagram";
    version = "bd12863f45fbbd5c7db06d5ec8be8987b10253bf";
    src = fetchFromGitHub {
      owner = "lotem";
      repo = "librime-octagram";
      rev = "bd12863f45fbbd5c7db06d5ec8be8987b10253bf";
      fetchSubmodules = false;
      sha256 = "sha256-77g72tee4ahNcu3hfW1Okqr9z8Y6WrPgUhw316O72Ng=";
    };
    date = "2024-02-05";
  };
  librime-proto = {
    pname = "librime-proto";
    version = "657a923cd4c333e681dc943e6894e6f6d42d25b4";
    src = fetchFromGitHub {
      owner = "lotem";
      repo = "librime-proto";
      rev = "657a923cd4c333e681dc943e6894e6f6d42d25b4";
      fetchSubmodules = false;
      sha256 = "sha256-HdypebfmzreSdEQBwbvRG6sJZPASP+e8Tew+GrMnpOQ=";
    };
    date = "2023-10-17";
  };
  rime-ice = {
    pname = "rime-ice";
    version = "69381881ef09b41d9bbbe523504a346d301f1547";
    src = fetchFromGitHub {
      owner = "iDvel";
      repo = "rime-ice";
      rev = "69381881ef09b41d9bbbe523504a346d301f1547";
      fetchSubmodules = false;
      sha256 = "sha256-dbf++KFfCQ4m+HoWk6UGTBS1ajyiCGMhNM5O0D3YuTQ=";
    };
    date = "2024-06-02";
  };
}
