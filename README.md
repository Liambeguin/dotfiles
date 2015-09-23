
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
```
$ cd ~/dev/dotfiles/gnome-terminal
$ dconf dump /org/gnome/terminal/legacy/ > terminal_settings
```
Generate a gnome profile for Ubuntu
-------------------------------
Change all you want using the GUI
```
$ cd ~/dev/dotfiles/gnome-terminal
$ gconftool-2 --dump  /apps/gnome-terminal > profile.xml
```

Install instructions
---------------------
**make sure you're sudo on the system !**
```
$ sudo -v
```

**Set things up and install**
```
$ mkdir -p ~/dev/ && cd ~/dev/
$ git clone https://github.com/Liambeguin/dotfiles.git
$ cd dotfiles
$ ./install
```
**Add Machine specific (or private) stuff to `~/.bashrc_local`** 


Other useful tools 
---------
* [pw](https://github.com/Liambeguin/pw)
```
$ cd ~/dev
$ git clone https://github.com/Liambeguin/pw.git
$ ln -sf $(pwd)/pw/pw ~/bin/pw 
```

TODOs
-----
- [ ] Hilight a specific set of words on the command line (eg :`$ bash | sed -e 's/foo/\x1b[7m&\x1b[0m/g'`)
- [ ] Cmdline tool to manage a todolist.
- [ ] add list of what install does to this file
- [ ] add dynamic window names in byobu
- [ ] dynamic bashrc depending on install script (cp bashrc in bash and edit that one ...)

