<?php

	// connect to the database with these credentials and throw and error upon failure
	$dsn = 'mysql:host=localhost;dbname=portfolio2';
	$username = 'root';
	$password = 'Pa$$w0rd';

	try
	{
		$db = new PDO($dsn, $username, $password);
	}
	catch (PDOException $e)
	{
		$error_message = $e->getMessage();
		echo $error_message;
		exit();
	}

	// want to make it look like we are still on the same page.
	include('contact2.aspx');

	// grab their inputs
	$name = filter_input(INPUT_POST, "name");
	$email = filter_input(INPUT_POST, "email");
	$phone = filter_input(INPUT_POST, "phone");
	$message = filter_input(INPUT_POST, "message");

	// we've done 0 javascript validation. so we should verify everything is good here
	if($name == null || $email == null || $phone == null || $message == null)
	{
		echo '<script>';
  		echo 'alert("Please ensure that your name, email, phone number, and message are filled and valid")';
		echo '</script>';
		exit();
	}

	// prepare the query to insert the message into our db
	$query = 'INSERT INTO contactform'
			.' (name, email, phoneNumber, message)'
			.' VALUES'
			.' (:name, :email, :phone, :message)';
	$statement = $db->prepare($query);
	$statement->bindValue(':name', $name);
	$statement->bindValue(':email', $email);
	$statement->bindValue(':phone', $phone);;
	$statement->bindValue(':message', $message);;
	$statement->execute();    
	$statement->closeCursor();

	// let the client know we've received their data
	echo '<script>';
  	echo 'alert("Thank you for contacting me! I will get back to you soon.")';
	echo '</script>';

?>