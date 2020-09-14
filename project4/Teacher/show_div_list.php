<?php 
 $cn =mysqli_connect("localhost","root","","project4");
 $enrollment=$_GET['enrollment'];
 $stmt = $cn->prepare("SELECT * FROM `result` WHERE `enrollment`='$enrollment';");

 $stmt->execute();
 
 $stmt->bind_result($rid,$exam_name,$enrollment,$sub_marks,$date);
 
 $result = array(); 
 
 while($stmt->fetch()){
 $temp = array();
 $temp['rid']=$rid;
 $temp['exam_name']=$exam_name;
 $temp['date']=$date;
 array_push($result, $temp);
 }

 echo json_encode($result);
 ?>
