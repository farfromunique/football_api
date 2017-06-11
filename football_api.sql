CREATE DATABASE IF NOT EXISTS `football_api` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `football_api`;

CREATE TABLE IF NOT EXISTS `games` (
  `UID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `game_date` date DEFAULT NULL,
  `away_team` int(11) unsigned NOT NULL,
  `away_score` int(11) DEFAULT NULL,
  `home_team` int(11) unsigned NOT NULL,
  `home_score` int(11) DEFAULT NULL,
  `winner` enum('Home','Away','Tie','Not played') NOT NULL DEFAULT 'Not played',
  PRIMARY KEY (`UID`),
  KEY `FK_games_teams` (`home_team`),
  KEY `FK_games_teams_2` (`away_team`),
  CONSTRAINT `FK_games_teams` FOREIGN KEY (`home_team`) REFERENCES `teams` (`UID`),
  CONSTRAINT `FK_games_teams_2` FOREIGN KEY (`away_team`) REFERENCES `teams` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` (`UID`, `game_date`, `away_team`, `away_score`, `home_team`, `home_score`, `winner`) VALUES
	(1, '2017-04-15', 7, 19, 9, 14, 'Away'),
	(2, '2017-04-22', 2, 0, 7, 36, 'Home'),
	(3, '2017-04-29', 17, 7, 12, 31, 'Home'),
	(12, '2017-05-13', 9, 34, 3, 23, 'Away'),
	(13, '2017-05-13', 5, 15, 11, 30, 'Home'),
	(14, '2017-05-13', 1, 6, 7, 39, 'Home'),
	(15, '2017-05-13', 17, 25, 16, 10, 'Away'),
	(16, '2017-05-13', 14, 0, 6, 14, 'Home'),
	(17, '2017-05-20', 5, 14, 3, 3, 'Away'),
	(18, '2017-05-20', 7, 32, 6, 25, 'Away'),
	(19, '2017-06-03', 17, 0, 5, 46, 'Home'),
	(20, '2017-06-03', 3, 24, 6, 12, 'Home'),
	(21, '2017-06-03', 18, 43, 7, 0, 'Away'),
	(22, '2017-06-10', 13, 0, 5, 45, 'Home'),
	(23, '2017-06-10', 16, 0, 7, 55, 'Not played'),
	(24, '2017-06-10', 3, NULL, 8, NULL, 'Not played'),
	(25, '2017-06-10', 11, 52, 17, 6, 'Away');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;

CREATE TABLE `hometeam` (
	`UID` INT(11) UNSIGNED NOT NULL,
	`TeamName` VARCHAR(61) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `leagues` (
  `UID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `league_name` varchar(45) NOT NULL,
  `division` varchar(30) NOT NULL DEFAULT '1',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` (`UID`, `league_name`, `division`) VALUES
	(1, 'Western Washington Football Alliance', '1'),
	(2, 'Western Washington Football Alliance', '2'),
	(3, 'Western Washington Football Alliance', '3'),
	(4, 'Pacific Football League', '1');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `league_membership` (
  `team_uid` int(11) unsigned NOT NULL,
  `league_uid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`team_uid`,`league_uid`),
  KEY `FK_league_membership_leagues` (`league_uid`),
  CONSTRAINT `FK_league_membership_leagues` FOREIGN KEY (`league_uid`) REFERENCES `leagues` (`UID`),
  CONSTRAINT `FK_league_membership_teams` FOREIGN KEY (`team_uid`) REFERENCES `teams` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `league_membership` DISABLE KEYS */;
INSERT INTO `league_membership` (`team_uid`, `league_uid`) VALUES
	(1, 3),
	(2, 2),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(12, 2),
	(13, 3),
	(14, 3),
	(15, 3),
	(16, 3),
	(17, 1),
	(18, 4),
	(19, 4),
	(20, 4);
/*!40000 ALTER TABLE `league_membership` ENABLE KEYS */;

CREATE TABLE `pretty_games` (
	`Played on` DATE NULL,
	`Game` VARCHAR(125) NULL COLLATE 'utf8_general_ci',
	`Score` VARCHAR(25) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `teams` (
  `UID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_name` varchar(30) NOT NULL,
  `name_prefix` varchar(30) DEFAULT NULL,
  `specific_location` varchar(30) NOT NULL,
  `country` varchar(2) NOT NULL,
  `mascot` varchar(15) DEFAULT NULL,
  `active` enum('Active','Inactive','Unknown') NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` (`UID`, `team_name`, `name_prefix`, `specific_location`, `country`, `mascot`, `active`) VALUES
	(1, 'Cobras', 'Cowlitz Conty', 'Couwlitz County, WA', 'US', NULL, 'Active'),
	(2, 'Hurricanes', 'Northwest', 'WA', 'US', NULL, 'Active'),
	(3, 'Rams', 'Wenatchee', 'Wenatchee, WA', 'US', NULL, 'Active'),
	(4, 'Bulldogs', 'Bellingham', 'Bellingham, WA', 'US', NULL, 'Active'),
	(5, 'Wolfpack', 'Spokane', 'Spokane, WA', 'US', NULL, 'Active'),
	(6, 'Nighthawks', 'South Sound', 'Sumner, WA', 'US', NULL, 'Active'),
	(7, 'Grizzlies', 'Arlington', 'Arlington, WA', 'US', NULL, 'Active'),
	(8, 'Kings', 'Puyallup Nation', 'Puyallup, WA', 'US', NULL, 'Active'),
	(9, 'Ravens', 'Renton', 'Renton, WA', 'US', NULL, 'Active'),
	(10, 'Bengals', 'Pierce County', 'Pierce County, WA', 'US', NULL, 'Active'),
	(11, 'Rage', 'Tri-City', 'Tri-Cities, WA', 'US', NULL, 'Active'),
	(12, 'Storm', 'Kitsap', 'Kitsap, WA', 'US', NULL, 'Active'),
	(13, 'Bearcats', 'Gray\'s Harbor', 'Gray\'s Harbor, WA', 'US', NULL, 'Active'),
	(14, 'Mayhem', 'Thurston County', 'Thurston County, WA', 'US', NULL, 'Active'),
	(15, 'Vipers', 'Clark County', 'Clark County, WA', 'US', NULL, 'Active'),
	(16, 'Outlaws', 'Puget Sound', 'Tacoma, WA', 'US', NULL, 'Active'),
	(17, 'Vikings', 'Snohomish', 'Snohomish, WA', 'US', NULL, 'Active'),
	(18, 'Raiders', 'Portland', 'Portland, OR', 'US', NULL, 'Active'),
	(19, 'Renegades', 'Southern Oregon', 'OR', 'US', NULL, 'Active'),
	(20, 'Pitbulls', 'Washington County', 'Washington County, OR', 'US', NULL, 'Active');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;

CREATE TABLE `visitingteam` (
	`UID` INT(11) UNSIGNED NOT NULL,
	`TeamName` VARCHAR(61) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `hometeam`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `hometeam` AS SELECT games.UID, CONCAT(teams.name_prefix,' ',teams.team_name) AS TeamName FROM teams, games WHERE teams.uid = games.home_team ;

DROP TABLE IF EXISTS `pretty_games`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` VIEW `pretty_games` AS SELECT
	games.game_date AS `Played on`,
	concat(visitingteam.TeamName, ' @ ',hometeam.TeamName) AS Game,
	concat(games.away_score,' - ',games.home_score) AS Score
FROM
	games
		LEFT JOIN (visitingteam, hometeam)
			ON (games.UID = visitingteam.UID AND games.UID = hometeam.UID) ;

DROP TABLE IF EXISTS `visitingteam`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `visitingteam` AS SELECT games.UID, CONCAT(teams.name_prefix,' ',teams.team_name) AS TeamName FROM teams, games WHERE teams.uid = games.away_team ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;