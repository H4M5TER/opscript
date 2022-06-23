export WINIP=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf)
export HTTP_PROXY=http://$WINIP:7890
export HTTPS_PROXY=$HTTP_PROXY
# VcXsrv
export DISPLAY=$WINIP:0.0
