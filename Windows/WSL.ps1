$WSL_HOST = bash.exe -c "ifconfig eth0 | awk '/inet / {print \`$2}'"

# Code Server
netsh interface portproxy delete v4tov4 listenport=8080 listenaddress=0.0.0.0 protocol=tcp
netsh interface portproxy add v4tov4 listenport=8080 listenaddress=0.0.0.0 connectport=8080 connectaddress=$WSL_HOST protocol=tcp
