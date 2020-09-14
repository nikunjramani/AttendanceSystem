import face_recognition
from PIL import Image, ImageDraw
import mysql.connector
import cv2
import numpy as np
import datetime
import pickle

conn=mysql.connector.connect(host="localhost",user="root",passwd="",database="project4")
cursor=conn.cursor()
now=datetime.datetime.now()
now = now.strftime('%Y-%m-%d %H:%M:%S')

faculty_name=input("Enter Faculty Name:")
division=input("Enter Division:")
subject_name=input("Enter Subject Name:")
class_name=input("Enter Class Name:")

def insertAttendanceData(name_list):
	for i in name_list:
		sql="""INSERT INTO `attendance` ( `enrollment`, `times`, `subject_name`, `class_name`) VALUES (%s, %s, %s, %s);"""
		val=(i,now,subject_name,class_name)
		result=cursor.execute(sql,val)
		conn.commit()

def insertLectureRecord():
	sql="""INSERT INTO `lecture_record` (`faculty_name`, `subject_name`, `division`, `time`) VALUES (%s, %s, %s, %s);"""
	val=(faculty_name,subject_name,division,now)
	result=cursor.execute(sql,val)
	conn.commit()
	
new_list=[]
with open('./Data/image.dat','rb') as f:
	new_list=pickle.load(f)	

known_face_enrollment=list(new_list.keys())
known_face_encodings=np.array(list(new_list.values()))

test_image = face_recognition.load_image_file('./img/groups/group.jpg')
face_locations = face_recognition.face_locations(test_image)
face_encodings = face_recognition.face_encodings(test_image, face_locations)
pil_image = Image.fromarray(test_image)

draw = ImageDraw.Draw(pil_image)

name_list=[]

for(top, right, bottom, left), face_encoding in zip(face_locations, face_encodings):
  matches = face_recognition.compare_faces(known_face_encodings, face_encoding,tolerance=0.5)

  name = "Unknown Person"

  if True in matches:
    first_match_index = matches.index(True)
    name = known_face_enrollment[first_match_index]
    name_list.append(name)
    print(name)
  draw.rectangle(((left, top), (right, bottom)), outline=(255,255,0))
  text_width, text_height = draw.textsize(name)
  draw.rectangle(((left,bottom - text_height - 10), (right, bottom)), fill=(255,255,0), outline=(255,255,0))
  draw.text((left + 6, bottom - text_height - 5), name, fill=(0,0,0))

  
insertAttendanceData(name_list)
insertLectureRecord()
del draw


pil_image.show()
pil_image.save('identify.jpg')
