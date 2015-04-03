<?php
$CONFIG = array(
  'datadirectory' => '/DATA/data',
  'apps_paths' => array (
    0 => array (
      'path' => OC::$SERVERROOT.'/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => array (
      'path' => '/DATA/apps',
      'url' => '/apps2',
      'writable' => true,
    ),
  ),
  'version' => '8.0.0',
  'dbname' => 'owncloud',
  'dbhost' => 'localhost',
  'dbuser' => 'owncloud',
  'installed' => false,
  'loglevel' => '3',
  'logfile' => '/DATA/logs/owncloud/owncloud.log',
  'appstoreenabled' => true,
  'appstoreurl' => 'http://api.apps.owncloud.com/v1',  
);
