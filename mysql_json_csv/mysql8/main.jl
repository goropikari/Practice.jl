using MySQL, Tables

host = "127.0.0.1"
user = "root"
passwd = "test"
conn = DBInterface.connect(MySQL.Connection, host, user, passwd)

DBInterface.execute(conn, "drop database if exists foo")
DBInterface.execute(conn, "create database foo")
DBInterface.execute(conn, "create table foo.bar (id int, name varchar(255))")
DBInterface.execute(conn, "insert into foo.bar values (1, 'foo'), (2, 'bar')")
cursor = DBInterface.execute(conn, "select * from foo.bar")

for row in Tables.rows(cursor)
    println(row)
end
# MySQL.TextRow{true}:
# :id    1
# :name   "foo"
# MySQL.TextRow{true}:
# :id    2
# :name   "bar"
