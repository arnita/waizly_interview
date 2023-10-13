<?php

function miniMaxSum($arr) {
   
    sort($arr);
    
   
    $totalSum = array_sum($arr);
    
   
    $minSum = $totalSum - $arr[count($arr) - 1]; 

   
    $maxSum = $totalSum - $arr[0];
    
   
    echo $minSum . ' ' . $maxSum;
}

$arr = [1, 3, 5, 7, 9];
miniMaxSum($arr);
?>