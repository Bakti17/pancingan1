<?php
	include 'koneksi.php';
	
	$stm = $db->prepare("SELECT gambar FROM tempat");
    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);
	$encoded_image = base64_encode($result);
	$gbmr = "<img src='data:image/jpeg;base64,{$encoded_image}'>";
	echo json_encode($result);