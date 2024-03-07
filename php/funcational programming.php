<?php

/**
 * destructuring syntax with simulate named parameters(不用記前後順序)
 */
function createUser(array $data) {
    // Array destructuring
    ['name' => $name, 'email' => $email, 'age' => $age] = $data;
}

// Call the function with an associative array(simulate named parameters)
createUser(['name' => 'John', 'email' => 'john@example.com', 'age' => 30]);

/*
* Memoization
* 如果需要重覆使用返回的函式，可以使用記憶體快取住，下次取用減少資源浪費
* 如果在 memoization 函數中出現異常或錯誤
* 1.可能會導致系統性能下降
* 2.導致記憶體使用增加，甚至可能導致記憶體不足
* 3.可能會導致系統的其他部分使用這些不正確的結果，從而導致更多的錯誤
*/
function demo(){
    static $cache;
    if (is_null($cache)){
        $cache = some_expensive_operation();
    }
    return $cache;
}

/**
 * 動態創建局部函數
 */
function partial(/* $func, $args... */)
{
    $args = func_get_args();
    $func = array_shift($args);
 
    return function() use ($func, $args)
    {
        return call_user_func_array($func, array_merge($args, func_get_args()));
    };
}
 
function add($a, $b)
{
    return $a + $b;
}
 
$inc = partial('add', 1);
$dec = partial('add', -1);
 
echo $inc(3); //4
echo $dec(3); //2

/**
 * partial function application
 * 從一函數中創造出它的局部函數出來。
 */
$first_char = function ($string){
    return substr($string, 0, 1);
};

$second_char = function ($string){
    return substr($string, 1, 2);
};

array_map($first_char, ['Dino', 'Amy', 'Birdy']);
// ['D', 'A', 'B']

array_map($second_char, ['Dino', 'Amy', 'Birdy']);
// ['i', 'm', 'i']

//動態創建局部函數
function partial(/* $func, $args... */){
    $args = func_get_args();
    $func = array_shift($argc);

    return function() use ($func, $args){
        return call_user_func_array($func, array_merge($args, func_get_args()));
    };
}

function add($a, $b){
    return $a + $b;
}

$inc = partial('add', 1);
$dec = partial('add', -1);
echo $inc(3); //4
echo $dec(3); //2

/**
 * Anonymous function
 * 匿名函數
 */
$value = 5;
$func_name = function($param) use ($value){
    return $param + $value;
};
echo $func_name(3); //8

$plus_one = function($var){
    return $var + 1;
};

$func_name = function($param) use($plus_one){
    return $param + $plus_one($param);
};
echo $func_name(3);//7

/**
 * Lambda
 * recursion 遞迴，例如：運算連續整數總合
 */
//loop
function head_sum($x){
    $sum=0;
    for($x; $x > 0; $x--){
        $sum += $x;
    }
    return $sum;
}

//recursion
function head_sum($x){
    echo $x . PHP_EOL;
    return ($x === 1) ? $x : $x + head_sum($x - 1);
}
head_sum(10);
