import os                           
import cv2                          
import numpy as np        
import face_recognition	
import pickle

recognizer = cv2.face.LBPHFaceRecognizer_create()                               
path ="image"                                                           

def createDataFile(list,division):
	path="./Data/image.dat"
	
	with open(path,'wb') as f:
		pickle.dump(list,f)
		
		
def getImagesWithID(path):
	imageFolders = [os.path.join(path, f) for f in os.listdir(path)]   
	list={}
	for imageFolder in imageFolders:
		imagePaths = [os.path.join(imageFolder, f) for f in os.listdir(imageFolder)]
		for imagePath in imagePaths:
				ID = os.path.split(imagePath)[-1]
				filename, file_extension = os.path.splitext(ID)
				print(filename)	
				img=face_recognition.load_image_file(imagePath)
				encoding=face_recognition.face_encodings(img)	
				list[filename]=encoding[0]
		
		createDataFile(list,filename)

getImagesWithID(path);
             
cv2.destroyAllWindows()                                      
