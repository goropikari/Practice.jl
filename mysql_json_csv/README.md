# MySQL --> JSON / CSV

## Environment
- ArchLinux
- MySQL 5.7
- Julia 1.1.1

# How To Use
```julia
$ docker run --name mysql -e MYSQL_ROOT_PASSWORD=test -d -p 3306:3306 mysql:5.7
$ git clone https://github.com/goropikari/Practice.jl
$ cd Practice.jl/mysql_json_csv
$ julia --project=. -e "using Pkg; Pkg.instantiate()"
$ julia --project=. main.jl
```
