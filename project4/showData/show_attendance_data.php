<?php 
	$cn =mysqli_connect("localhost","root","","project4");
	$enrollment=$_GET['enrollment'];
	
	$data=mysqli_query($cn,"SELECT semester,division FROM `students` WHERE `enrollment`='$enrollment'");
	$row=mysqli_fetch_array($data);
	$division=$row[1];
	$semester=$row[0];
	
	#get all subject from given semester and division
	$data=mysqli_query($cn,"SELECt subject_name FROM `time_table` WHERE `division`='$division' AND `semester`='$semester'");
	$subject_name=array();
	while($row=mysqli_fetch_assoc($data)){
		array_push($subject_name,$row['subject_name']);
	}
	
	$attendance=array();
	#retriving total lecture,la and attended lec,lab
	foreach($subject_name as $i){
		$temp=array();
		$data=mysqli_query($cn,"SELECT count(lrid) FROM `lecture_record` WHERE `division`='$division' AND `subject_name`='$i'");
		$row=mysqli_fetch_array($data);
		$total_lec=$row[0];
		
		$data=mysqli_query($cn,"SELECT count(lrid) FROM `lecture_record` WHERE `division`='$division' AND `subject_name`='$i'");
		$row=mysqli_fetch_array($data);
		$total_lab=$row[0];
		
		$data=mysqli_query($cn,"SELECT count(aid) FROM `attendance` WHERE `enrollment`='$enrollment' AND `subject_name`='$i'");
		$row=mysqli_fetch_array($data);
		$attend_lec=$row[0];
		
		$data=mysqli_query($cn,"SELECT count(aid) FROM `attendance` WHERE `enrollment`='$enrollment' AND `subject_name`='$i'");
		$row=mysqli_fetch_array($data);
		$attend_lab=$row[0];
		
		$temp['attend_lab']=$attend_lab;
		$temp['attend_lec']=$attend_lec;
		$temp['total_lab']=$total_lab;
		$temp['total_lec']=$total_lec;
		$temp['suject_name']=$i;
		array_push($attendance,$temp);
	}
	echo json_encode($attendance);
 ?>