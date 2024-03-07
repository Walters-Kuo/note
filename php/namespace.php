<?
/**
 * If you want to avoid requiring the external files manually in your code, you can use the autoload features provided by the composer.
 */
// math_functions.php
namespace MyMath;

function add($num1, $num2) {
    return $num1 + $num2;
}

function subtract($num1, $num2) {
    return $num1 - $num2;
}

//Example 1: calling the function without a namespace 
require_once 'math_functions_no_namespaces.php';

$result = add(10, 5);
echo 'Result: '.$result; // Output: Result: 15


//Example 2: calling the function with namespaces via "use function"
// example_2.php
namespace MyApp;

require_once 'math_functions.php';
use function MyMath\add;

$result = add(10, 5);
echo "Result: " . $result; // Output: Result: 15

//Example 3: calling the function specifying an alias, with Namespaces via "use function" 
namespace MyApp;

require_once 'math_functions.php';
use function MyMath\add as myAddFunction;

$result = myAddFunction(10, 5);
echo 'Result: '.$result; // Output: Result: 15

//Example 4: Using Multiple Functions with "use function" 
namespace MyApp;

require_once 'math_functions.php';
use function MyMath\{add, subtract};

$result1 = add(10, 5);
$result2 = subtract(10, 5);

echo "add() result: " . $result1 . PHP_EOL; // Output: add() result: 15
echo "subtract() result: " . $result2 . PHP_EOL; // Output: sub() result: 5

//You can define alias also for multiple imports in this way:
use function MyMath\{add as myAddFunction, subtract as mySubtractFun

"autoload": {
    "files": [
        "math_functions.php"
    ]
},

//To be sure that your autoload file is updated run:
composer dumpautoload


// example_5.php
namespace MyApp;
require_once 'vendor/autoload.php';
use function MyMath\{add, subtract};

$result1 = add(10, 5);
echo "add() result: " . $result1 . PHP_EOL; // Output: add() result: 15