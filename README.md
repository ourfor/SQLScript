# SQLScript
sql statement


# 安装docker版本SQL Server

```bash
docker pull mcr.microsoft.com/mssql/server:2017-latest
```
启动SQL Server
```bash
sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=<YourStrong!Passw0rd>' \
   -p 1433:1433 --name sql1 \
   -d mcr.microsoft.com/mssql/server:2017-latest


sudo docker exec -it sql1 "bash"
```

# 连接

```bash
sudo docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P '<YourStrong!Passw0rd>' \
   -Q 'ALTER LOGIN SA WITH PASSWORD="<YourNewStrong!Passw0rd>"'
```


参考[官方文档](https://docs.microsoft.com/zh-tw/sql/linux/quickstart-install-connect-docker?view=sql-server-2017&pivots=cs1-bash)
