<?php 
$cn =mysqli_connect("localhost","root","","project4");
$faculty_name=$_POST['faculty_name'];
$subject=$_POST['subject'];
$division=$_POST['division'];
$time=$_POST['time'];
$qry="INSERT INTO `lecture_record` (`lrid`, `faculty_name`, `subject`, `divison`, `time`) VALUES (NULL, '$faculty_name', '$subject', '$division', now());";
mysqli_query($cn,$qry);
if(mysqli_affected_rows($cn)>0){
    echo "1";   
}
else{
    echo "-1";
}
mysqli_close($cn);
?>