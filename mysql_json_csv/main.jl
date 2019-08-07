import MySQL, JSON
import Tables: rowtable, columntable
import DelimitedFiles: writedlm
import Random: randstring, seed!
seed!(0)

host = "127.0.0.1"
user = "root"
password = "test"
conn = MySQL.connect(host, user, password, port=3306)

MySQL.execute!(conn, "truncate table testdb.testtb")
MySQL.execute!(conn, "create database if not exists testdb")
create_table = """
create table if not exists testdb.testtb (
    id int,
    name varchar(255),
    rand decimal(10,8)
)
"""
MySQL.execute!(conn, create_table)

for id in 1:1000
    sql = """insert into testdb.testtb values
            ($(id), \"$(randstring())\", $(rand()));"""
    MySQL.execute!(conn, sql)
end

data = MySQL.Query(conn, "select * from testdb.testtb;")
json_data = JSON.json(rowtable(data))
println("Writing a json file")
write("test.json", json_data)

data = MySQL.Query(conn, "select * from testdb.testtb;")
columntable(data)

println("Writing a CSV file")
data = MySQL.Query(conn, "select * from testdb.testtb;")
writedlm("test.csv", data, ',')
MySQL.disconnect(conn)
