#!/bin/bash
# Router-side watchdog. Run as: sudo bash watchdog.sh
# Shows every NVRAM change. On ;reboot payload, kills and restarts
# httpd (simulates what netctrl/multiWAN would trigger on real hardware).

setup() {
    curl -s "http://127.0.0.1/goform/fast_setting_wifi_set?reasy-ui-1.0.3.js" \
      -d "ssid=Tenda_RX3&wrlPassword=wifi12345&loginPwd=admin" > /dev/null 2>&1
}

tail -f /home/t/rx3/httpd_usermode.log | while read -r line; do
    case "$line" in
        *NVRAM-SET*)
            echo "$line"
            if echo "$line" | grep -q ';reboot'; then
                killall qemu-arm 2>/dev/null
                sleep 2
                bash /home/t/rx3/restart_httpd.sh
                sleep 2
                setup
            fi
            ;;
    esac
done
