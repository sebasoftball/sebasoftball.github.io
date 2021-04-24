<?php
	require_once '../lib/general_functions.php';
	require_once '../model/model.php';

	ini_set('display_errors',1);
	error_reporting(E_ALL);

	// determine action
	if (isset($_POST['action'])) { // check get and post
		$action = $_POST['action'];
	} else if (isset($_GET['action'])) {
		$action = $_GET['action'];
	} else {
		header("Location: http://2020.sebasoftball.org/");
		exit();
	}

	switch ($action) {
		case 'main':
			include "../view/home.php";
			break;
		default:
			include "../view/home.php";
			break;
	}
?>