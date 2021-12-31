<?php
	include 'koneksi.php';
	
	$email = $_POST['email'};
	$nama = $_POST['nama'};
	$hp = $_POST['hp'};
	
	$stmt = $db->prepare("UPDATE user SET nama = ?, hp=? WHERE email=?");
	$stmt->execute([$nama,$hp,$email]);
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	echo json_encode($result);
?>
	