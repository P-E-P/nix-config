let
  version = "0.0.22";
in
self: super: {
  discord = super.discord.overrideAttrs (
    _: {
      src = builtins.fetchurl {
        url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
        sha256 = "19xbmrd782m4lp2l0ww5v3ip227g0z8pplxigxga96q43rvp6p0p";
      };
    }
  );
}
