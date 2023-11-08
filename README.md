# coursun

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

----------
----------

Flutter
Android studio

Work on iPhone 15 for sure :
- Create / store "annonce" in db
- Read "annonce"
- Delete "annonce"

Coursun project : 
- coursun > pubspec.yaml = env & dependencies
  (assets are in the "images" folder)
- coursun > images = assets
- coursun > lib = my dart files
  - main.dart = app
  - annonceListe.dart = items list
    show items / swipe to delete item
  - annonceView.dart = item screen
    show item data
  - annonce.dart = data variables
  - annonceDataBase.dart = database sqlite (init in pubspec.yaml)
    when the bd is empty, it car return 3 items
  - annonceForm.dart = item creation
    can create data in database
  - contactWidget.dart = not finish..
  - favoriteWidget.dart = like system not finish (no db correspondance)

Next steps :
  - update "annonce" in db
  - store annonce "likes" in db
  - crud "user.db"
    - "myaccount" view
      - my favorite
  - uui management
  - auth
  - reset pw
  - "plantType.db"
  - contact form / messaging / livechat
  - report management
  
