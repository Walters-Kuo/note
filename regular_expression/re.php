<?php

/**
 * 移除字串開頭和結尾的空白字符
 * 使用正規表示式取代多個空格為一個空格
 */
function normalizeSpaces($string)
{
    $trimmedString = trim($string);
    return preg_replace("/\s+/", " ", $trimmedString);
}

//取Latest之後, Data 之前的字串
$pattern = "/Latest(.*?)Data/s";
//(.*?) is a non-greedy match for any characters (captured in a group).
//This ensures it matches as few characters as possible while still satisfying the rest of the pattern

// Perform the regex match
if (preg_match($pattern, $input, $matches)) {
    // Output the matched value
    echo "The substring between 'Latest' and 'Data' is:\n" .
        trim($matches[1]) .
        "\n";
} else {
    echo "No match found.\n";
}

/**
 * 使用正規表示式刪除僅包含空格和換行符的行
 */
function removeEmptyLines($string)
{
    return preg_replace('/^\s*[\r\n]+/m', "", $string);
}

//一個以上的空格當成explode 的separator , 但只有一個空格的不列入此條件
$parts = preg_split("/ {2,}/", $input); //{2,} matches two or more spaces
