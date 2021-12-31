<?php
	include 'koneksi.php';
	
	$tempat = $_POST['tempat'];
	
	//$tempat = "Pemancingan Dadi Rejo Ketinggen";
	
	$stmt = $db->prepare("SELECT kuota FROM tempat WHERE nama_tempat=?");
	$stmt->execute([$tempat]);
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	echo json_encode($result);
?>