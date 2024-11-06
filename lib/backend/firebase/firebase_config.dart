import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAiFN7abM5ve6aybFPwtltRPA-k7kG4v6A",
            authDomain: "gymbuddy24-e18fc.firebaseapp.com",
            projectId: "gymbuddy24-e18fc",
            storageBucket: "gymbuddy24-e18fc.firebasestorage.app",
            messagingSenderId: "725014605626",
            appId: "1:725014605626:web:afc5fa4c776b734df76a03",
            measurementId: "G-0YFGLRJYPN"));
  } else {
    await Firebase.initializeApp();
  }
}
