import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAvYR2FqXhWZT3qyr3bUvCRCDYK7bzGLlk",
            authDomain: "netflix-project-final-xsgnz9.firebaseapp.com",
            projectId: "netflix-project-final-xsgnz9",
            storageBucket: "netflix-project-final-xsgnz9.appspot.com",
            messagingSenderId: "209150770892",
            appId: "1:209150770892:web:ffc878f9b9c47a6850cc69"));
  } else {
    await Firebase.initializeApp();
  }
}
