<?php

$example = 'Appel @ Ratte';
$example2 = 'apple vs ratte'
$output = preg_split('/ (@|vs) /', $input);

//those two are equivalent
$foo = $bar ?? 'something';
$foo = isset($bar) ? $bar : 'something';


composer require --dev phpunit/phpunit ^8.5 --ignore-platform-req=ext-mongodb
composer require --dev phpspec/prophecy --ignore-platform-req=ext-mongodb
composer -W require --dev kenjis/ci-phpunit-test:^2.0  --ignore-platform-req=ext-mongodb

brew install brew-php-switcher
brew install php@7.4
brew unlink php@8.2.12 && brew link --force —-overwrite php@7.4



