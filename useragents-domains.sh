#!/bin/env php
<?php

if (!isset($argv[1])) {
  echo "no file ommited\n";
  exit(1);
}

if (!file_exists($argv[1])) {
  echo "file '" . $argv[1] . "' not found\n";
  exit(1);
}

$fp = fopen($argv[1], "r");
$uds = array();
while(!feof($fp)) {
  $line = trim(fgets($fp));
  $chunks = explode(" ", $line);
  array_shift($chunks);
  $domain = array_shift($chunks);
  $useragent = trim(implode(" ", $chunks));
  if (($domain != "") && ($useragent != "")) {
    if (!isset($uds[$useragent])) {
      $uds[$useragent] = array();
    }
    $uds[$useragent][$domain] = $domain;
  }
}

foreach($uds as $useragent=>$domains) {
  echo urldecode($useragent)  . "\n";
  foreach($domains as $domain) {
    echo "  " . $domain . "\n";
  }
  echo "\n";
}
