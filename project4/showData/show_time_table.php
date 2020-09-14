<?php 
 $cn =mysqli_connect("localhost","root","","project4");
 $enrollment=$_GET['enrollment'];
 $data=mysqli_query($cn,"SELECT semester,division FROM `students` WHERE `enrollment`='$enrollment'");
 $row=mysqli_fetch_array($data);	
 $divison=$row[1];
 $semester=$row[0];
 
 $stmt = $cn->prepare("SELECT * FROM `time_table` WHERE division='$divison' and semester='$semester';");

 $stmt->execute();
 
 $stmt->bind_result($tid,$day,$subject_name,$faculty_name,$class_name,$time,$division,$semester);
 
 $attendance = array(); 
 
 while($stmt->fetch()){
 $temp = array();
 $temp['tid'] = $tid;
 $temp['day']=$day;
 $temp['subject_name']=$subject_name;
 $temp['faculty_name']=$faculty_name;
 $temp['class_name']=$class_name;
 $temp['time']=$time;
 $temp['divison']=$division;
 $temp['semester']=$semester;
 array_push($attendance, $temp);
 }

 echo json_encode($attendance);
 ?>