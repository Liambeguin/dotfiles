
Editing Users
---------------
* Add a new User : `sudo adduser -m -s /bin/bash -c "Liam BEGUIN" foo`
* Set it's Password : `sudo passwd -f foo`
* Add to Sudoer (Fedora) : `sudo usermod -aG wheel foo`
* Add to Sudoer (Ubuntu) : `sudo usermod -aG sudo foo`
* Remove user and it's home : `sudo userdel -r foo`

Generate a gnome profile for Fedora
-------------------------------

Change all you want using the GUI

```sh
$ cd ~/dev/dotfiles/gnome-terminal
$ dconf dump /org/gnome/terminal/legacy/ > terminal_settings
```
Generate a gnome profile for Ubuntu
-------------------------------

Change all you want using the GUI

```sh
$ cd ~/dev/dotfiles/gnome-terminal
$ gconftool-2 --dump  /apps/gnome-terminal > profile.xml
```

Generate color palette for xterm based on Fedora profile
--------------------------------------------------------

```sh
$ grep palette gnome-terminal/terminal_settings | \
sed 's/rgb/\n/g' | sed 's/^(\(.*\)).*$/\1/g' | tail -n+2 | \
awk 'BEGIN {FS="," ; i=0 } {printf "xterm*color %d: rgb:%02X/%02X/%02X \n", i, $1, $2, $3; i++}'
```

Install instructions
---------------------

**make sure you're sudo on the system !**

```sh
$ sudo -v
```

**Set things up and install**

```sh
$ sudo dnf install git ansible
$ mkdir -p ~/dev/ && cd ~/dev/
$ git clone git@git.sr.ht:~liambeguin/dotfiles
$ cd dotfiles
$ ansible-playbook -K local.yml
```

**Add Machine specific (or private) stuff to `~/.bashrc_local`**

Other useful tools
---------

* [pw](https://github.com/Liambeguin/pw)

```sh
$ cd ~/dev
$ git clone https://github.com/Liambeguin/pw.git
$ ln -sf $(pwd)/pw/pw ~/bin/pw
```

NOTE
---

simple terminal: http://git.suckless.org/st/
