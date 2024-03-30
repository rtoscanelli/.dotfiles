# i3wm Configuration
## Software
- [i3](https://i3wm.org/) - Window Manager
- [polybar](https://github.com/polybar/polybar/wiki) - Status bar
- [nitrogen](https://wiki.archlinux.org/title/nitrogen) - Wallpaper setter
- [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen) - Lock screen
- [dunst](https://github.com/dunst-project/dunst) - Notification daemon
- [rofi](https://github.com/davatorium/rofi) - Program launcher
- [autorandr](https://github.com/phillipberndt/autorandr) - Monitor configuration

## Setup
For each configuration file do:
```bash
ln -s <dotfile config> <target>
```

### Betterlockscreen
To upload a wallpaper:
```bash
betterlockscreen -u <wallpaper path>
```

To lock and test:
```bash
betterlockscreen -l [EFFECT]

[EFFECT]:
- pixel
- blur
- dim
```
