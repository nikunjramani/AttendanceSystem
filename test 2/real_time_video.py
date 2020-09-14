import face_recognition
import cv2
import mysql.connector
import numpy as np
import pickle

video_capture = cv2.VideoCapture(0)

new_list=[]
with open('./Data/image.dat','rb') as f:
	new_list=pickle.load(f)	

known_face_names=list(new_list.keys())
known_face_encodings=np.array(list(new_list.values()))
    
# Initialize some variables
face_locations = []
face_encodings = []
face_names = []
process_this_frame = True

while True:
	ret, frame = video_capture.read()
	small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)
	rgb_small_frame = small_frame[:, :, ::-1]

	if process_this_frame:
		face_locations = face_recognition.face_locations(rgb_small_frame)
		face_encodings = face_recognition.face_encodings(rgb_small_frame, face_locations)

		face_names = []
		for face_encoding in face_encodings:
			matches = face_recognition.compare_faces(known_face_encodings, face_encoding,tolerance=0.5)
			name = "Unknown"

			# # If a match was found in known_face_encodings, just use the first one.
			# if True in matches:
			#     first_match_index = matches.index(True)
			#     name = known_face_names[first_match_index]

			# Or instead, use the known face with the smallest distance to the new face
			face_distances = face_recognition.face_distance(known_face_encodings, face_encoding)
			best_match_index = np.argmin(face_distances)
			if matches[best_match_index]:
				name = known_face_names[best_match_index]
			face_names.append(name)

	process_this_frame = not process_this_frame


	for (top, right, bottom, left), name in zip(face_locations, face_names):
		top *= 4
		right *= 4
		bottom *= 4
		left *= 4
		cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), 2)
		font = cv2.FONT_HERSHEY_SIMPLEX
		name=str(name)
		cv2.putText(frame, name, (left + 6, bottom - 6), font, 1.0, (255, 255, 255), 1)

	cv2.imshow('Video', frame)

	if cv2.waitKey(10) & 0xFF == ord('q'):
		break

video_capture.release()
cv2.destroyAllWindows()