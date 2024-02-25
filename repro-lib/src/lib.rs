pub fn print_message() -> &'static str {
    "Hello World!"
}

#[cfg(test)]
mod test {
    #[test]
    fn it_works() {
        assert!(true);
    }
}
