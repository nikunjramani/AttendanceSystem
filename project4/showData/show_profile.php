<?php 
 $cn =mysqli_connect("localhost","root","","project4");
 $enrollment=$_GET['enrollment'];
 $stmt = $cn->prepare("SELECT * FROM `students` WHERE `enrollment`='$enrollment';");

 $stmt->execute();
 
 $stmt->bind_result($sid,$name,$rollno,$enrollment,$division,$moileno,$address,$semester);
 
 $attendance = array(); 
 
 while($stmt->fetch()){
 $temp = array();
 $temp['name']=$name;
 $temp['enrollment']=$enrollment;
 array_push($attendance, $temp);
 }

 echo json_encode($attendance);
 ?>