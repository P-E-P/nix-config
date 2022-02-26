{ ... }:
{
  imports = [
    ./base
    ./hosts/lambda
  ];

  system.stateVersion = "21.11";
}
