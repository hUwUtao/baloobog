use std::{
    io::{self, prelude::*, BufReader},
    net::{TcpListener, TcpStream},
};

use async_std::task;

const RESPONSE: &'static str =
    "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 4\r\n\r\n:3\r\n";

async fn handle_connection(mut stream: TcpStream) -> io::Result<()> {
    for line in BufReader::new(&mut stream).lines() {
        if line.unwrap_or_default().is_empty() {
            break;
        }
    }
    stream.write_all(RESPONSE.as_bytes())
}

#[async_std::main]
async fn main() {
    let listener = TcpListener::bind("0.0.0.0:8080").unwrap();
    for stream in listener.incoming() {
        if let Ok(stream) = stream {
            task::spawn(handle_connection(stream));
        }
    }
}
