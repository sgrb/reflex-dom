{ mkDerivation, pkgs, dependent-map, ghcjs-dom, lens
, mtl, ref-tf, reflex, text, these
, transformers, data-default, semigroups, blaze-builder, aeson
, ghc, exception-transformers
, dependent-sum-template, bifunctors, bimap
, raw-strings-qq, zenc, random, monad-control, keycode, hlint
, unbounded-delays, jsaddle
}:

mkDerivation {
  pname = "reflex-dom-core";
  version = "0.3";
  src = builtins.filterSource (path: type: !(builtins.elem (baseNameOf path) [ ".git" "dist" ])) ./.;
  buildDepends = [
    aeson
    bifunctors
    bimap
    blaze-builder
    data-default
    dependent-map
    dependent-sum-template
    exception-transformers
    ghcjs-dom
    jsaddle
    keycode
    lens
    monad-control
    mtl
    random
    ref-tf
    reflex
    semigroups
    text
    these
    transformers
    unbounded-delays
    zenc
  ] ++ (if ghc.isGhcjs or false then [] else [
    raw-strings-qq
  ]);
  testDepends = if ghc.isGhcjs or false then [] else [
    hlint
  ];
  pkgconfigDepends = if ghc.isGhcjs or false then [] else [
    raw-strings-qq
  ];
  license = null;
}
