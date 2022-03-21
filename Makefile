COUNT ?= 10000

.PHONY: all bench-rs

all:
	$(MAKE) -C split-c
	(cd split-rs && cargo build -r)

bench-c:
	(cd rand-rs; cargo run -r) | /usr/bin/time -p ./split-c/split $(COUNT) > /dev/null

bench-rs:
	(cd rand-rs; cargo run -r) | /usr/bin/time -p ./split-rs/target/release/split-rs $(COUNT) > /dev/null

plot-c:
	rm -f data-c.txt
	@(printf '%d\t' 1000; $(MAKE) COUNT=1000 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 2000; $(MAKE) COUNT=2000 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 3000; $(MAKE) COUNT=3000 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 4000; $(MAKE) COUNT=4000 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 5000; $(MAKE) COUNT=5000 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 6000; $(MAKE) COUNT=6000 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 7000; $(MAKE) COUNT=7000 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 8000; $(MAKE) COUNT=8000 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 9000; $(MAKE) COUNT=9000 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt

plot-rs:
	rm -f data-rs.txt
	@(printf '%d\t' 1000; $(MAKE) COUNT=1000 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 2000; $(MAKE) COUNT=2000 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 3000; $(MAKE) COUNT=3000 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 4000; $(MAKE) COUNT=4000 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 5000; $(MAKE) COUNT=5000 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 6000; $(MAKE) COUNT=6000 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 7000; $(MAKE) COUNT=7000 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 8000; $(MAKE) COUNT=8000 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 9000; $(MAKE) COUNT=9000 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
