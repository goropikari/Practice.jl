# Connect PostgreSQL from Julia

- Julia 1.1.1
- PostgreSQL 11.5

```
docker run -d --name postgres -e POSTGRES_PASSWORD=test -p 5432:5432 postgres:11.5
git clone https://github.com/goropikari/Practice.jl
cd Practice.jl/postgres
julia --project=. -e "using Pkg; Pkg.instantiate()"
```
