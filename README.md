# Flake based nixos configuration

build using the following command:
```
nix build ./flake.nix#nixosConfigurations.lambda.config.system.build.toplevel
```

## Installation
Use the following command to install the configuration:
```
nixos-rebuild boot --flake ./#machine_name
```
You need to replace the machine name by the machine you wish to install, for example a machine called `Lambda` would be installed using the following command:
```
nixos-rebuild boot --flake ./#lambda
```
