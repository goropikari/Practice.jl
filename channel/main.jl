capa = 10
c = Channel(capa)

function f(c)
    for i in 1:10
        put!(c, i)
    end
end

function g(c)
    for i in c
        sleep(0.5)
        println("From g: ", i)
    end
    println("Finish")
end

@async f(c)
@async g(c)
