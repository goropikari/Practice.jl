- Julia v1.4.2
- MySQL.jl v1.1.1
- Tables v1.0.4

```bash
docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=test -d mysql:8.0.20 mysqld --default-authentication-plugin=mysql_native_password
julia --project=. main.jl
#=> MySQL.TextRow{true}:
#=>  :id    1
#=>  :name   "foo"
#=> MySQL.TextRow{true}:
#=>  :id    2
#=>  :name   "bar"
```
