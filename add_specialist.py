import firebase_admin
from firebase_admin import credentials, firestore

# Initialize Firebase Admin SDK
cred = credentials.Certificate("./serviceAccountKey.json")  # Ensure correct path
firebase_admin.initialize_app(cred)

# Get Firestore client
db = firestore.client()

def add_specialist(title, image_url):
    """Adds a specialist to the Firestore Specialists collection."""
    specialists_ref = db.collection("Specialists")
    specialists_ref.add({
        "title": title,
        "imageUrl": image_url,
        "createAt": firestore.SERVER_TIMESTAMP,  # Timestamp for ordering
    })
    print(f"Specialist '{title}' added successfully!")

# Example data
title = "Expert Hair Stylist"
image_url = "https://example.com/hair-stylist.jpg"

# Call function to add a specialist
add_specialist(title, image_url)
