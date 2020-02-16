from receptionist.encode_faces import enf
from receptionist.recognize_face import rec_face_image

enf(r"C:\Users\ASUS\PycharmProjects\AIReceptionist\receptionist\static\check\20200108_204736.jpg")

res = rec_face_image(r"C:\Users\ASUS\PycharmProjects\AIReceptionist\receptionist\static\check\20200108_204853.jpg")
print("result======>", res)
