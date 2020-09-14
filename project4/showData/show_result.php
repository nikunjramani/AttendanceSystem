<?php
	$cn =mysqli_connect("localhost","root","","project4");
	$rid=$_GET['rid'];
	
	$marks_details=array();
	$data=mysqli_query($cn,"SELECT `sub_marks` FROM `result` WHERE `rid`='$rid'");
	while($row=mysqli_fetch_assoc($data)){
		$sub_marks=$row['sub_marks'];
		$ma=json_decode($sub_marks);
		foreach($ma as $i){
			$temp=array();
			$temp['sub']=$i->sub;
			$temp['total']=$i->total;
			$temp['obtain']=$i->obtain;
			array_push($marks_details,$temp);
		}
	}
	print json_encode($marks_details);
?>