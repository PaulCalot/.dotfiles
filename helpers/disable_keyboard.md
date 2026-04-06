Liste des devices :
```shell
grep -E 'Handlers|Name' /proc/bus/input/devices
```

Nouvelle règle :
```shell
sudo vim /etc/udev/rules.d/99-internal-keyboard.rules
```

Ajouter cette ligne :
Note : il faut changer le nom pour qu'il correspondre au nom du clavier embarqué :
```shell
ACTION=="add|change", ATTRS{name}=="AT Translated Set 2 keyboard", ENV{LIBINPUT_IGNORE_DEVICE}="1"
```

Appliquer la nouvelle règle :
```shell
sudo udevadm control --reload-rules && sudo udevadm trigger
```
