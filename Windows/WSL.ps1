$WSL_HOST = bash.exe -c "ifconfig eth0 | awk '/inet / {print \`$2}'"

# Code Server
netsh interface portproxy add v4tov4 listenport=8080 listenaddress=* connectport=8080 connectaddress=$WSL_HOST protocol=tcp
