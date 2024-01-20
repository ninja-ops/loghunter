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
$useragents = array();
while(!feof($fp)) {
  $line = trim(fgets($fp));
  $chunks = explode(" ", $line);
  array_shift($chunks);
  array_shift($chunks);
  $useragent = implode(" ", $chunks);
  if ($useragent != "") {
    $useragents[$useragent] = $useragent;
  }
}

foreach($useragents as $useragent) {
  echo $useragent . "\n";
}
