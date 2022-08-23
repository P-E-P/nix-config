let
  version = "0.0.19";
in
self: super: {
  discord = super.discord.overrideAttrs (
    _: {
      src = builtins.fetchurl {
        url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
        sha256 = "1403vdc7p6a8mhr114brfp4dqvikaj5s71wrx20ca5y6srsv5x0r";
      };
    }
  );
}
