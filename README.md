
# Editing Users
#### Add a new User
```
$ sudo adduser -c "Liam BEGUIN" foo
```
#### Set it's Password
```
$ sudo passwd -f foo
```
#### Add to Sudoer
```
$ sudo usermod -aG wheel foo
```
#### Remove user and it's home 
```
$ sudo userdel -r foo
```

# Install instructions

#### make sure you're sudo on the system !
```
$ sudo -v
```

#### Set things up and install
```
$ mkdir -p ~/dev/ && cd ~/dev/
$ git clone https://github.com/Liambeguin/dotfiles.git
$ cd dotfiles
$ ./install
```
