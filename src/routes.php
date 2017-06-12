<?php

// Routes
$app->get('/api/games/[{team}]', function ($request, $response, $args) {
	$team = $args['team'] ?? 'All';
	$this->logger->info("Football_api: Games for " . $team);
	$dsn = 'mysql:host=' . MYSQL_Server . ';dbname=' . MYSQL_Database;
	$db = new PDO($dsn, MYSQL_Read_User, MYSQL_Read_Password);
	$res = $db->query('SELECT * FROM pretty_games');
	$args['query'] = $res->fetchAll(PDO::FETCH_ASSOC);

	return $this->renderer->render($response, 'json.phtml', $args);
});
