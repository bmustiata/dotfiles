
echo Make sure you source this.

LOCAL_SERVER_IP=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null)

export DISPLAY=$LOCAL_SERVER_IP:0
export LIBGL_ALWAYS_INDIRECT=1

echo "Run this in a command prompt"
echo "set HOME=c:\\Users\\bm669313\\AppData\\Roaming"
echo "type nul > c:\\Users\\bm669313\\AppData\\Roaming\\.Xauthority"
echo "xauth add ${LOCAL_SERVER_IP}:0 . $(mcookie)"


