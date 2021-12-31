<?php
	include 'koneksi.php';
	
	$stm = $db->prepare("SELECT id,nama_tempat,alamat,kuota FROM tempat");
    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($result);
	