export WINDOWS_HOST=$(grep nameserver /etc/resolv.conf | sed 's/nameserver //')
export HTTP_PROXY=$WINDOWS_HOST:7890
export HTTPS_PROXY=$HTTP_PROXY
