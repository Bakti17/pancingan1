<?php
include 'koneksi.php';

    $email = $_POST['email'];
    $ubah = $_POST['ubah'];
	$pass = md5($ubah);
	

    $stmt = $db->prepare("SELECT email,nama,kelamin,hp FROM user WHERE email = ? AND pass = ?");
    $stmt->execute([$email,$pass]);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($result);
    