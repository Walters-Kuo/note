fn main() {
    let x = 5;
    println!("x = {}", x);

    let x = x + 1;
    {
        let x = x * 2;
        println!("x = {}", x);
    }
    println!("x = {}", x);
    //println!("Hello, world!");
}
