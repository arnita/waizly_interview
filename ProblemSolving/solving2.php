<?php
function miniMaxSum($arr) {
    sort($arr);


    $minSum = array_sum($arr) - $arr[0];


    $maxSum = array_sum($arr) - $arr[count($arr) - 1];

    echo $minSum . " " . $maxSum;
}

$arr = [1, 2, 3, 4, 5];

miniMaxSum($arr);