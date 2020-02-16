# USAGE
# python encode_faces.py --dataset dataset --encodings encodings.pickle

# import the necessary packages
# from imutils import paths
import face_recognition
import argparse
import pickle
import cv2
import os


def enf(fn):
    # grab the paths to the input images in our dataset
    print("[INFO] quantifying faces...")
    imagePaths = [fn]

    # initialize the list of known encodings and known names
    knownEncodings = []
    knownNames = []

    # loop over the image paths
    for (i, imagePath) in enumerate(imagePaths):
        # extract the person name from the image path
        print("[INFO] processing image {}/{}".format(i + 1,
                                                     len(imagePaths)))
        print("imagepath-------", imagePath)
        name = "face"
        print("id=", name)
        # load the input image and convert it from RGB (OpenCV ordering)
        # to dlib ordering (RGB)

        print("imagePath===>", imagePath)

        image = cv2.imread(imagePath)
        print(len(image))
        rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

        boxes = face_recognition.face_locations(rgb,
                                                model='hog')

        # compute the facial embedding for the face
        encodings = face_recognition.face_encodings(rgb, boxes)

        # loop over the encodings
        for encoding in encodings:
            # add each encoding + name to our set of known names and
            # encodings
            knownEncodings.append(encoding)
            knownNames.append(name)
            print(name, 'name')

    # dump the facial encodings + names to disk
    print("[INFO] serializing encodings...")
    data = {"encodings": knownEncodings, "names": knownNames}
    f = open('faces.pickles', "wb")
    f.write(pickle.dumps(data))
    f.close()


