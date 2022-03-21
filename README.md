# Benchmark of `split` implementation

```bash
$ make
$ make bench-c
(cd rand-rs; cargo run -r) | /usr/bin/time -p ./split-c/split 1000 > /dev/null
    Finished release [optimized] target(s) in 0.00s
     Running `target/release/rand-rs`
real 2.36
user 2.28
sys 0.01
$ make bench-rs
(cd rand-rs; cargo run -r) | /usr/bin/time -p ./split-rs/target/release/split-rs 1000 > /dev/null
    Finished release [optimized] target(s) in 0.00s
     Running `target/release/rand-rs`
real 0.97
user 0.88
sys 0.00
```
