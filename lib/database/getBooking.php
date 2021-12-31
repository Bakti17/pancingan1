<?php 

	include 'koneksi.php';
	
	$email = $_POST['email'];
	//$email = "b@mail.com";
	
	$stmt = $db->prepare("SELECT nama_tempat,tanggal,nomer,id FROM booking WHERE email =?");
	$stmt->execute([$email]);
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	echo json_encode($result);
	
	