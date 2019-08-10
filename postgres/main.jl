using LibPQ, Tables, DelimitedFiles
conn = LibPQ.Connection("dbname=postgres host=127.0.0.1 user=postgres password=test port=5432")
execute(conn, "create table if not exists hoge (id int)")
for i in 1:10
    execute(conn, "insert into hoge values ($i)")
end
result = execute(conn, "SELECT * FROM hoge")
writedlm("test.csv", result)
