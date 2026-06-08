## Objectif

Activer automatiquement un script utilisateur quand un clavier externe est branché/débranché, afin de gérer l’activation/désactivation du clavier interne.

---

## 1. Supprimer toute ancienne règle udev conflictuelle (si existante)

```bash
sudo rm -f /etc/udev/rules.d/99-internal-kbk.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
```

---

## 2. Créer la règle udev (déclenchement systemd user)

Créer le fichier :

```bash
sudo vim /etc/udev/rules.d/99-keyboard-toggle.rules
```

Contenu :

```bash
ACTION=="add|remove", SUBSYSTEM=="input", TAG+="systemd", ENV{SYSTEMD_USER_WANTS}+="toggle-internal-kb.service"
```

---

## 3. Créer le service systemd utilisateur

Créer le dossier si nécessaire :

```bash
mkdir -p ~/.config/systemd/user
```

Créer le service :

```bash
vim ~/.config/systemd/user/toggle-internal-kb.service
```

Contenu :

```ini
[Unit]
Description=Toggle internal keyboard

[Service]
Type=oneshot
ExecStart=%h/.dotfiles/helpers/toggle_internal_kb.sh
```

---

## 4. Activer le service utilisateur

```bash
systemctl --user daemon-reload
systemctl --user enable toggle-internal-kb.service
```

Optionnel pour debug :

```bash
systemctl --user start toggle-internal-kb.service
journalctl --user -u toggle-internal-kb.service
```

---

## 5. Rendre le script exécutable

```bash
chmod +x ~/.dotfiles/helpers/toggle_internal_kb.sh
```

---

## 6. Recharger udev

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```

---

## Résultat

- udev détecte l’ajout/retrait d’un périphérique input
- déclenche un service systemd utilisateur
- le script s’exécute dans la session graphique
- permet d’activer/désactiver le clavier interne via `xinput` (ou équivalent selon session Wayland/X11)

```

```
