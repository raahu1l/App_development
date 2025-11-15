🟦 Survexus — Smart Survey Creation & Analytics App

A cross-platform Flutter application that allows users to create surveys, collect responses, view analytics, and chat with an in-app AI assistant.
Supports guest mode, normal users, VIP users, and an admin panel (only for admins).

🚀 Features Overview

👤 User Roles
**Role	Features**

Guest	Respond to surveys only. Cannot create surveys or view analytics.
User	Create surveys, respond to surveys, see analytics for their own surveys.
VIP User	Unlimited surveys, advanced analytics, VIP-only features, no upsell banners.
Admin	Access to admin panel, can manage system-level settings. Hidden from non-admin users.

**📱 Core App Features**

**✔ Create Surveys**
Multiple question types
Survey visibility management
Automatic duplicate-response protection
Guest-safe mode

**✔ Respond to Surveys**
Fast and simple UI
Guest mode supported
Prevents duplicate responses
Tracks and stores responses using Firebase Firestore

**✔ Survey Management**
Edit/delete survey
View number of responses (real-time)
Organized response management screen

**✔ Analytics Dashboard**
Bar charts, pie charts
Prevents mixing of analytics from other survey IDs
Fixes layout visibility and readability issues

**Admin**
Tracks and search users 
Activate surveys when created 
Close/Delete surveys
Give VIP access to users 

Professor Admin
Email:vpg@gmail.com
Password:1234

Student Admin
Email:rahul@gmail.com
password:1234

VIP users get enhanced analytics
✔ In-App AI Chatbot (Groq Llama-3.3-70B)

**Fully role-based responses:**
Guest answers
User answers
VIP answers

Survexus-only domain restriction
Key stored safely in secrets.dart (ignored in git)

**🔐 Security**
✅ Secrets Protected
No API keys are committed
lib/secrets.dart is in .gitignore
Groq key loaded only at runtime

**.gitignore includes:**
APKs & build artifacts
Android keystores
Google Services files
Environment files
Secret keys

**🗄️ Tech Stack**
**Frontend**
Flutter 3.x
Dart
Provider (state management)

**Backend**
Firebase Auth
Firebase Firestore
Firebase Cloud Messaging

**AI Integration**
Groq Llama-3.3-70B
Role-aware chatbot
Domain-restricted prompts

**📁 Project Structure (Important Folders)**
lib/
 ├── models/
 ├── providers/
 ├── screens/
 ├── services/
 ├── utils/
 ├── widgets/
 ├── secrets.dart           # IGNORED — contains Groq API key
 ├── main.dart              # bootstrap + splash init
assets/
android/
ios/
test/                       # Flutter tests

🧪 Testing Setup
Tests included:
VIP Upsell Visibility (guest → upsell visible; VIP → hidden)
VIP Feature Blocking
Admin panel hidden from non-admin users

**To run tests:**
flutter test

**🏁 Running the App**
Debug:
flutter run

**Release APK:**
flutter build apk --release


**APK output:**
build/app/outputs/flutter-apk/app-release.apk
Use this for GitHub release draft uploads.

**🎨 App Splash Screen**
Uses native Android splash
White background + centered Survexus logo

**Configured inside:**
android/app/src/main/res/drawable/launch_background.xml
styles.xml
MainActivity.kt

**🛠️ Build & Deployment Notes**
🔒 Never Commit:
API keys
Keystore files (.jks, .keystore)
google-services.json
app-release.apk

These are already in .gitignore.

**GitHub Push Protection:**
If you accidentally commit a key, GitHub will block the push.
Fix steps:
Remove the secret from code
Reset commit
Push again

(Optional) allow the push in GitHub

Move the key to lib/secrets.dart

**📦 Future Enhancements**

Survey scheduling
Collaborative survey creation
AI-generated survey questions

