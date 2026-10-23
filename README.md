# Tenda RX3 US — Security Vulnerabilities

**Vendor**: Shenzhen Tenda Technology Co., Ltd.  
**Product**: Tenda RX3  
**Firmware**: US_RX3V1.0br_V16.03.13.11_multi_TDE01  
**Download**: https://www.tendacn.com/us/download/detail-4218.html

## Vulnerabilities

| # | Type | Endpoint | Parameter | CWE | CVSS 3.1 |
|---|------|----------|-----------|-----|----------|
| 1 | [Authentication Bypass](auth_bypass/detail.md) | /goform/* | URL query string | CWE-287 | 9.8 |
| 2 | [Stack Overflow (DHCP)](dhcp_gbk_overflow/detail.md) | UDP port 67 | DHCP Option 12 | CWE-121 | 8.6 |
| 3 | [Command Injection](cmd_injection_remoteIp/detail.md) | /goform/SetRemoteWebCfg | remoteIp | CWE-78 | 8.8 |
| 4 | [Command Injection](cmd_injection_mac/detail.md) | /goform/AdvSetMacMtuWan | mac | CWE-78 | 8.8 |
| 5 | [Command Injection](cmd_injection_ipv6/detail.md) | /goform/setIPv6Status | serverIPAddr | CWE-78 | 8.8 |
| 6 | [Password Change No Verify](password_change_no_verify/detail.md) | /goform/fast_setting_wifi_set | loginPwd | CWE-287 | 8.8 |
| 7 | [Factory Reset No Auth](factory_reset_no_auth/detail.md) | /goform/SysToolRestoreSet | — | CWE-306 | 7.5 |

## Analysis Method

Static analysis via Ghidra 12.1.3, dynamic testing via QEMU user-mode emulation of the extracted ARM httpd binary.

## Timeline

| Date | Action |
|------|--------|
| 2026-10-23 | Vulnerabilities discovered |
