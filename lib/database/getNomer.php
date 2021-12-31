<?php
	include 'koneksi.php';
	
	$tempat = $_POST['tempat'];
	$tanggal = $_POST['tanggal'];
	
	//$tempat = "Pemancingan Dadi Rejo Ketinggen";
	//$tanggal = "2021-12-27";
	
	$stmt = $db->prepare("SELECT nomer FROM booking WHERE nama_tempat=? AND tanggal=? ORDER BY nomer");
	$stmt->execute([$tempat,$tanggal]);
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	echo json_encode($result);
?>