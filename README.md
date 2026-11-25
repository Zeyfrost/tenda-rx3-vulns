# Tenda RX3 US Security Vulnerabilities

| Firmware Name | Firmware Version | Download Link |
| ------------- | ---------------- | ------------- |
| RX3           | V16.03.13.11_multi | https://static.tenda.com.cn/tdeweb/download/RX3/US_RX3V1.0br_V16.03.13.11_multi_TDE01.zip |

## Vulnerabilities

| # | CVE | CVSS 4.0 | Type | Endpoint | Parameter |
|---|-----|----------|------|----------|-----------|
| 1 | CVE-2026-136547 | 9.3 Critical | [Authentication Bypass](auth_bypass/detail.md) | /goform/* | URL query string |
| 2 | CVE-2026-136548 | 9.3 Critical | [Stack Overflow (DHCP)](dhcp_gbk_overflow/detail.md) | UDP port 67 | DHCP Option 12 |
| 3 | CVE-2026-136549 | 9.3 Critical | [Command Injection](cmd_injection_remoteIp/detail.md) | /goform/SetRemoteWebCfg | remoteIp |
| 4 | CVE-2026-136550 | 8.5 High | [Command Injection](cmd_injection_mac/detail.md) | /goform/AdvSetMacMtuWan | mac |
| 5 | CVE-2026-136552 | 8.5 High | [Command Injection](cmd_injection_ipv6/detail.md) | /goform/setIPv6Status | remoteIP |
| 6 | CVE-2026-136553 | 9.3 Critical | [Password Change No Verify](password_change_no_verify/detail.md) | /goform/fast_setting_wifi_set | loginPwd |
| 7 | CVE-2026-136554 | 2.1 Low | [Factory Reset No Auth](factory_reset_no_auth/detail.md) | /goform/SysToolRestoreSet | — |
