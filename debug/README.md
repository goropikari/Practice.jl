# Julia Debug

```bash
docker build -t julia-1.3.0-debug .
docker run --name julia -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined julia-1.3.0-debug /bin/bash
cd /root/julia-1.3.0/
./julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.3.0 (2019-11-26)
 _/ |\__'_|_|_|\__'_|  |
|__/                   |

julia>
```


Open another terminal and type as follows.
```bash
docker exec -it julia /bin/bash
ps aux | grep julia
gdb -p 10
(gdb) b jl_arrayset
Breakpoint 1 at 0x7fc0f19801e0: file /root/julia-1.3.0/src/array.c, line 568.
(gdb) c
Continuing.

# Back to REPL and type some command like, x = [1, 2], Then

(gdb) n
570	    jl_value_t *eltype = jl_tparam0(jl_typeof(a));

(gdb) p a
$1 = (jl_array_t *) 0x7fa1256761d0

(gdb) ptype jl_array_t
type = struct {
    void *data;
    size_t length;
    jl_array_flags_t flags;
    uint16_t elsize;
    uint32_t offset;
    size_t nrows;
    union {
        size_t maxsize;
        size_t ncols;
    };
}

(gdb) p a->length
$2 = 3
```

