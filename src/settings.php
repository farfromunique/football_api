<?php
return [
    'settings' => [
        'displayErrorDetails' => true, // set to false in production
        'addContentLengthHeader' => false, // Allow the web server to send the content-length header

        // Renderer settings
        'renderer' => [
            'template_path' => __DIR__ . '/../templates/',
        ],

        // Monolog settings
        'logger' => [
            'name' => 'football_api',
            'path' => __DIR__ . '/../logs/football_api.log',
            'level' => \Monolog\Logger::DEBUG,
        ],
    ],
];
