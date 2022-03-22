use std::io::{self, Read, Write};

fn main() -> io::Result<()> {
    let count = std::env::args().nth(1).unwrap_or("100".into())
        .parse::<usize>().unwrap();

    let mut buf: Vec<u8> = Vec::with_capacity(100 << 20);
    unsafe { buf.set_len(100 << 20) };
    io::stdin().read_exact(&mut buf)?;

    let stdout = io::stdout();
    let mut w = io::BufWriter::new(stdout);

    for _i in 0..count {
        for v in buf.split(|c| *c == b'0') {
            w.write(&v)?;
            w.write(&[b'\n'])?;
        }
    }

    Ok(())
}
