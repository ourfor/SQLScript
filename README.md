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
