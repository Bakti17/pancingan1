<?php	
	include 'koneksi.php';
	
	$tempat = $_POST['tempat'];
	$tanggal = $_POST['tanggal'];
	$email = $_POST['email'];
	$no = $_POST['nomer'];
	// $no = 1;
	$id = null;
	
	// $tempat = "Pemancingan Dadi Rejo Ketinggen";
	// $tanggal = "2021-12-27";
	// $email = "b@mail.com";
	// $no = "8";
	
	$stmt = $db->prepare("INSERT INTO booking(id,nama_tempat,email,tanggal,nomer)
							VALUES (?,?,?,?,?)");
	$stmt->execute([$id,$tempat,$email,$tanggal,$no]);
	
?>