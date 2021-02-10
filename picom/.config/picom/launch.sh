killall -q picom

echo "---" | tee -a /tmp/picom.log

picom --experimental-backends >> /tmp/picom.log
