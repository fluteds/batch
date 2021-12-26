::: Sends a POST url request to bad-domains.walshy.dev/report

@echo off

set /P url=Enter URL to Report: 

curl -X POST https://bad-domains.walshy.dev/report -H "Accept: application/json" -H "Content-Type: application/json" -d "{\"domain\": \"%url%\"}"

pause