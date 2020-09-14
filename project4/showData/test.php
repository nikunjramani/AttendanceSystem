<?php

$data = '[{
	"sub": "obtain",
	"total": 40
}]';

$character = json_decode($data);
echo $character[0]->total;

$a='[{"sub":"java","total":40,"obtain":30},{"sub":"java","total":40,"obtain":30},{"sub":"java","total":40,"obtain":30},{"sub":"java","total":40,"obtain":30}]';
$s = json_decode($a);
echo $s[0]->sub;