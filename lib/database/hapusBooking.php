<?php
	include 'koneksi.php';
	
	$id = $_POST['id'];
	//$id = "b@mail.com";
	
	$stmt = $db->prepare("DELETE FROM booking WHERE id=?");
	$stmt->execute([$id]);