# Tenda RX3 US Security Vulnerabilities

| Firmware Name | Firmware Version | Download Link |
| ------------- | ---------------- | ------------- |
| RX3           | V16.03.13.11_multi | https://static.tenda.com.cn/tdeweb/download/RX3/US_RX3V1.0br_V16.03.13.11_multi_TDE01.zip |

## Vulnerabilities

| # | Type | Endpoint | Parameter |
|---|------|----------|-----------|
| 1 | [Authentication Bypass](auth_bypass/detail.md) | /goform/* | URL query string |
| 2 | [Stack Overflow (DHCP)](dhcp_gbk_overflow/detail.md) | UDP port 67 | DHCP Option 12 |
| 3 | [Command Injection](cmd_injection_remoteIp/detail.md) | /goform/SetRemoteWebCfg | remoteIp |
| 4 | [Command Injection](cmd_injection_mac/detail.md) | /goform/AdvSetMacMtuWan | mac |
| 5 | [Command Injection](cmd_injection_ipv6/detail.md) | /goform/setIPv6Status | remoteIP |
| 6 | [Password Change No Verify](password_change_no_verify/detail.md) | /goform/fast_setting_wifi_set | loginPwd |
| 7 | [Factory Reset No Auth](factory_reset_no_auth/detail.md) | /goform/SysToolRestoreSet | — |
