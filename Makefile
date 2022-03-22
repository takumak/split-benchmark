COUNT ?= 100

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
	@(printf '%d\t' 1000; $(MAKE) COUNT=10 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 2000; $(MAKE) COUNT=20 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 3000; $(MAKE) COUNT=30 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 4000; $(MAKE) COUNT=40 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 5000; $(MAKE) COUNT=50 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 6000; $(MAKE) COUNT=60 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 7000; $(MAKE) COUNT=70 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 8000; $(MAKE) COUNT=80 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt
	@(printf '%d\t' 9000; $(MAKE) COUNT=90 bench-c 2>&1 | sed -ne '/^user /s/^user //p') >> data-c.txt

plot-rs:
	rm -f data-rs.txt
	@(printf '%d\t' 1000; $(MAKE) COUNT=10 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 2000; $(MAKE) COUNT=20 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 3000; $(MAKE) COUNT=30 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 4000; $(MAKE) COUNT=40 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 5000; $(MAKE) COUNT=50 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 6000; $(MAKE) COUNT=60 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 7000; $(MAKE) COUNT=70 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 8000; $(MAKE) COUNT=80 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
	@(printf '%d\t' 9000; $(MAKE) COUNT=90 bench-rs 2>&1 | sed -ne '/^user /s/^user //p') >> data-rs.txt
