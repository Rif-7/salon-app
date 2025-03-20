import firebase_admin
from firebase_admin import credentials, firestore

cred = credentials.Certificate("./serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
def add_service(title, description, image_url, price):
    services_ref = db.collection("Services")
    services_ref.add({
        "title": title,
        "description": description,
        "imageUrl": image_url,
        "price": price,
        "createAt": firestore.SERVER_TIMESTAMP,
    })
    print(f"Service '{title}' added successfully!")


title = "Beard Styling"
description = "Sharpen your look"
image_url = "https://static.toiimg.com/thumb/msid-92538949,width-400,resizemode-4/92538949.jpg"
price = "150"
add_service(title, description, image_url, price)
