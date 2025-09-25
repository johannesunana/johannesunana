# Hi, I’m Johannes!

Here's my sanitized `.gitconfig` for reference:  
[View it here](dotfiles/.gitconfig)

My other useful configs:
- [`.bashrc`](dotfiles/.bashrc)  
- [`gpg-agent.conf`](dotfiles/gpg-agent.conf)

# GPG Setup Notes (Windows 11 + Git Bash)

These steps make sure Git uses Gpg4win/Kleopatra for commit signing,
with an 8-hour TTL and Kleopatra's pinentry GUI.

## 1. Install Gpg4win

-   Install [Gpg4win](https://gpg4win.org).
-   Note your install path, e.g. `C:\Program Files (x86)\GnuPG\bin`.

## 2. Update Git config

``` bash
git config --global commit.gpgsign true
git config --global gpg.program "C:/Program Files (x86)/GnuPG/bin/gpg.exe"
git config --global user.signingkey <YOURKEYID>
```

## 3. PATH (prefer Gpg4win over Git's bundled GPG)

Add this to `~/.bashrc`:

``` bash
export PATH="/c/Program Files (x86)/GnuPG/bin:$PATH"
```

Reload:

``` bash
source ~/.bashrc
```

## 4. gpg-agent.conf (timeouts + Kleopatra pinentry)

Create `~/.gnupg/gpg-agent.conf`:

    default-cache-ttl 28800
    max-cache-ttl 86400
    pinentry-program C:/Program Files (x86)/Gpg4win/bin/pinentry-w32.exe

## 5. Restart agent

``` bash
gpgconf --kill gpg-agent
```

## 6. Test

``` bash
echo "test" | gpg --clearsign   # should show Kleopatra GUI
```

## 7. (Optional) Check cache expiry

``` bash
gpg-connect-agent 'keyinfo --list' /bye
```

Look for the last field (`T <timestamp>`) → when your passphrase cache
expires.