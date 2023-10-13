<?php

$numbers = [1, 2, 3, 4, 5];

// Menghapus angka 1
$key = array_search(1, $numbers);
if ($key !== false) {
    unset($numbers[$key]);
}

// Menjumlahkan sisa angka
$result = array_sum($numbers);

echo "Hasil penjumlahan setelah menghilangkan angka 1 = " . $result."</br>";




$numbers = [1, 2, 3, 4, 5];

// Menghapus angka 1
$key = array_search(2, $numbers);
if ($key !== false) {
    unset($numbers[$key]);
}

// Menjumlahkan sisa angka
$result = array_sum($numbers);

echo "Hasil penjumlahan setelah menghilangkan angka 2 = " . $result."</br>";


$numbers = [1, 2, 3, 4, 5];

// Menghapus angka 1
$key = array_search(3, $numbers);
if ($key !== false) {
    unset($numbers[$key]);
}

// Menjumlahkan sisa angka
$result = array_sum($numbers);

echo "Hasil penjumlahan setelah menghilangkan angka 3 = " . $result."</br>";



$numbers = [1, 2, 3, 4, 5];

// Menghapus angka 1
$key = array_search(4, $numbers);
if ($key !== false) {
    unset($numbers[$key]);
}

// Menjumlahkan sisa angka
$result = array_sum($numbers);

echo "Hasil penjumlahan setelah menghilangkan angka 4 = " . $result."</br>";

$numbers = [1, 2, 3, 4, 5];

// Menghapus angka 1
$key = array_search(5, $numbers);
if ($key !== false) {
    unset($numbers[$key]);
}

// Menjumlahkan sisa angka
$result = array_sum($numbers);

echo "Hasil penjumlahan setelah menghilangkan angka 5 = " . $result."</br>";