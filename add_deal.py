import firebase_admin
from firebase_admin import credentials, firestore

# Initialize Firebase Admin SDK
cred = credentials.Certificate("./serviceAccountKey.json")  # Ensure correct path
firebase_admin.initialize_app(cred)

# Get Firestore client
db = firestore.client()

def add_deal(title, description, image_url, price):
    """Adds a deal to the Firestore Deals collection."""
    deals_ref = db.collection("Deals")
    deals_ref.add({
        "title": title,
        "description": description,
        "imageUrl": image_url,
        "price": price,
        "createAt": firestore.SERVER_TIMESTAMP,  # Timestamp for ordering
    })
    print(f"Deal '{title}' added successfully!")

# Example data
title = "Bride Styling"
description = "Get 35% off on all services this summer!"
image_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkpcWTPU2De5zGGNH98rvQUvNZhLePn8matg&s"
price = "2500"

# Call function to add a deal
add_deal(title, description, image_url, price)
