cmd /c "wsl -- sudo service ssh start ; sudo service xrdp start"

$WSLIP = (wsl -- hostname -I) # better than bash.exe -c "ifconfig eth0 | awk '/inet / {print \`$2}'"

# Forward
# use netsh int port add v4tov4 port 127.0.0.1
