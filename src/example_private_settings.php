<?php

	if (ENVIRONMENT === 'Development') {
		DEFINE('MYSQL_Server','localhost');
	} else {
		DEFINE('MYSQL_Server','something.else.com');
	}
	DEFINE('MYSQL_Database','football_api');
	DEFINE('MYSQL_Read_User','read-only');		
	DEFINE('MYSQL_Read_Password','Read-Password');	// Stored plaintext. This file is in your gitignore, right?
	DEFINE('MYSQL_Write_User','Read-Write');		
	DEFINE('MYSQL_Write_Password','RW-Password');	// Stored plaintext. This file is in your gitignore, right?