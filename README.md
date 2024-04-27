# NOTE
Attention : ces différents .dotfiles sont partiellement liés... par exemple, les scripts dans bin/.local/scripts sont ajoutés au path dans le .zshrc (leur répertoire parent en réalité). 
- bin : scripts utiles pour lancer des sessions tmux et faire une recherche dans les cht.sh
- nvim : config pour NeoVim
- tmux : terminal multiplexer, configuration
- tree-sitter : à vérifier pour l'utilité, mais je pense que c'est la brique de base pour tous les LSP, ça ne fait pas de mal de l'avoir.
- zsh

# TODO 
- [ ] revoir le clean-env pour mes modifs
- [ ] ajouter le bash certainement (voir ansible où je décris les todos)
- [ ] ajouter i3
- [ ] mettre à jour la config de neovim

# DONE
- suppression de awesomewm - j'utiliserai i3 je pense - plus simple et moins compliqué à setup (il faut config en lua pour awesomewm)
- suppression de i3 pour l'instant, je le setup plus tard
- suppression de personal etc.
Note : on utilise ici .gitmodules, j'ai supprimé et remplacé par tout au même endroit.
J'ai simplement laissé tree-sitter car il me semble que c'est l'ingrédient de base de tous les LSP.
Et que donc il sera sans doute réutilsé, même si je me demande si c'était pas pour des raisons de dev qu'il était là.

# Réutilisation
Utiliser vos propres .dotfiles.
