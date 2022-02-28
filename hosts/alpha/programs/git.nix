{ ... }:

{
  enable = true;
  userName = "Pierre-Emmanuel Patry";
  userEmail = "pierre-emmanuel.patry" + "@" + "epita.fr";
  aliases = {
    lg = "log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
  };
  ignores = [ "*~" "*.swp" ".o" ".d" "format_marker"];
}
