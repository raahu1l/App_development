# auth_Flutter APK

Flutter Firebase Authentication App
This Flutter app demonstrates a full-featured Firebase Authentication integration with multiple sign-in methods, designed for a fitness tracker application. After successful authentication, users are directed to a dashboard where fitness data can be tracked and managed.

Features
User registration and login via email/password
Google account sign-in integration
Ability to login as a guest without registration
Password reset via email link for forgotten passwords
Phone number verification using OTP for secure authentication
User session persistence and management
Simple and clean UI for all authentication flows

Dashboard screen for fitness tracking after authentication

Getting Started
Prerequisites
Flutter SDK installed (Recommended version: 3.x or above)
Firebase project created with Authentication enabled
Firebase CLI (optional) installed for configuration

Firebase Setup
Create a new Firebase project at Firebase Console.

Enable the following Authentication methods in your Firebase project:
Email/Password
Google
Phone
Anonymous

Add your Flutter app to the Firebase project.

Download the google-services.json (for Android) and GoogleService-Info.plist (for iOS) and place them into respective platform directories.

Configure Firebase in your Flutter app as per official Firebase-Flutter integration docs.

Installation
Clone this repository and install dependencies:

bash
git clone 
cd - To the directory
flutter pub get
Running the App
Run on emulator or physical device:

bash
flutter run

Usage
Register a new user with email and password.
Login using email/password, Google account, or as a guest.
Use 'Forgot Password' to reset your password via email.
Login with your phone number; receive OTP and verify to access the app.
After successful authentication, users are redirected to the fitness tracker dashboard.

Dashboard Overview
The dashboard displays user fitness data such as steps, calories, heart rate, and activity history.
Users can view, update, and track their fitness goals.
Navigation to other features like workout logs, settings, and profile management is available from the dashboard.

Dependencies
firebase_core
firebase_auth
google_sign_in
fluttertoast (for notifications)
provider (optional for state management)

Other Flutter UI packages as needed

Notes
Ensure your Firebase project allows OAuth redirects for Google Sign-In.
Phone authentication requires a physical device or properly configured emulator with phone number testing enabled.
Guest login allows temporary user access but no persistence after logout or uninstall.
The dashboard is accessible only after successful authentication.

Contributing
Contributions and suggestions are welcome. Please fork this repo and create a pull request for any improvements.
