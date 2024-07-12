use std::io;

fn main() {
    println!("請猜測一個數字：");
    println!("你輸入你猜測的數字：");
    let mut guess = String::new();
    io::stdin()
        .read_line(&mut guess)
        .expect("讀取輸入失敗");
    println!("你猜測的數字是：{}", guess);
}
