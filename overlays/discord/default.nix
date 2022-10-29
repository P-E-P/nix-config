let
  version = "0.0.21";
in
self: super: {
  discord = super.discord.overrideAttrs (
    _: {
      src = builtins.fetchurl {
        url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
        sha256 = "18rmw979vg8lxxvagji6sim2s5yyfq91lfabsz1wzbniqfr98ci8";
      };
    }
  );
}
