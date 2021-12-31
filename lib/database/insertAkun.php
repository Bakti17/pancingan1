<?php	
	include 'koneksi.php';
	
	$email = $_POST['email'];
	$nama = $_POST['nama'];
	$ubah = $_POST['pass'];
	$pass = md5($ubah);
	$kel = $_POST['kel'];
	$hp = $_POST['hp'];
	$id = null;
	
	// $email = "c@mail.com";
	// $nama = "Cahyo";
	// $ubah = "c";
	// $pass = md5($ubah);
	// $kel = "L";
	// $hp = "085432154321";
	// $id = null;
	
	
	
	$stmt = $db->prepare("INSERT INTO user(id,email,nama,pass,kelamin,hp)
							VALUES (?,?,?,?,?,?)");
	$stmt->execute([$id,$email,$nama,$pass,$kel,$hp]);
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($result);
?>