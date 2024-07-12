<?php
empty() 函數會將 0、'0'、null、false、空陣列、空字符串和未設置的變量都視為空。

$example = 'Appel @ Ratte';
$example2 = 'apple vs ratte'
$output = preg_split('/ (@|vs) /', $input);

//those two are equivalent
$foo = $_POST['action'] ?? 'default';
$foo = isset($_POST['action']) ? $_POST['action'] : 'default';

// The above is identical to this if/else statement
if (isset($_POST['action'])) {
    $action = $_POST['action'];
} else {
    $action = 'default';
}

print 'Mr. ' . ($name ?? 'Anonymous');



composer require --dev phpunit/phpunit ^8.5 --ignore-platform-req=ext-mongodb
composer require --dev phpspec/prophecy --ignore-platform-req=ext-mongodb
composer -W require --dev kenjis/ci-phpunit-test:^2.0  --ignore-platform-req=ext-mongodb

brew install brew-php-switcher
brew install php@7.4
brew unlink php@8.2.12 && brew link --force —-overwrite php@7.4


function maybeGetUser(): user | null {
    if (!loggedIn){
        return null;
    } 
    return fetchUser();
}

//check phone number and email address
$email = 'example@example.com';
//^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$
if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "$email ok";
} else {
    echo "$email bad";
}

$phone_number = '0987654321';
if (preg_match('/^09\d{8}$/', $phone_number)) {
    echo "$phone_number ok";
} else {
    echo "$phone_number bad";
}

//比較兩個日期的差距
$date1 = new DateTime(date('Y-m-d'));
$date2 = new DateTime("2025-03-27");

$interval = $date1->diff($date2);
echo $interval->days;