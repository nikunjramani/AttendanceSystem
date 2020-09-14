import cv2                                                                      # openCV
import numpy as np                                                              # for numpy arrays
import mysql.connector
import os 
import cv2
import sys


def insertStudentData():
	conn=mysql.connector.connect(host="localhost",user="root",passwd="",database="project4")
	cursor=conn.cursor()
	sql="""INSERT INTO `students` (`sid`, `name`, `rollno`, `enrollment`, `division`, `mobileno`, `address`, `semester`) VALUES(%s,%s,%s,%s,%s,%s,%s,%s)"""
	val=(0,name,rollno,enrollment,division,mobileno,address,semester)
	result=cursor.execute(sql,val)
	conn.commit()


faceCascade = cv2.CascadeClassifier("Haarcascade/haarcascade_frontalface_default.xml")
video_capture = cv2.VideoCapture(0)


enrollment = input('Enter Enrollment Number : ')
name =input("Enter student's name : ")
rollno =input("Enter student's roll no. : ")
division=input("Enter Division :")
mobileno=input("Enter Mobile Number :")
semester=input("Enter Semester :")
address=input("Enter Address : ")

folderName=division
folderPath = os.path.join(os.path.dirname(os.path.realpath(__file__)), "image/"+folderName)

if not os.path.exists(folderPath):
    os.makedirs(folderPath)


count=0
while True:
	ret, frame = video_capture.read()
	gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

	faces = faceCascade.detectMultiScale(gray,scaleFactor=1.1,minNeighbors=5,minSize=(100, 100))
	padding=50
	for (x, y, w, h) in faces:
		cv2.rectangle(frame,(x-padding,y-padding),(x+w+padding,y+h+padding),(255,0,0),2)
		face = frame[y-50:y + h+50, x-50:x + w+50]
		face_resize = cv2.resize(face, (1000, 1000))
		cv2.imwrite(folderPath + "/" + enrollment +".jpg", face_resize) 
		count += 1
	
	cv2.imshow('Video', frame)
	cv2.waitKey(3000)
	if(count>=1):
		break


insertStudentData()
video_capture.release()
cv2.destroyAllWindows()
