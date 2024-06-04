import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC3_cVXDiitj56RyCJfnXtBbzrYYaZ3zbk",
            authDomain: "netflix-project-final.firebaseapp.com",
            projectId: "netflix-project-final",
            storageBucket: "netflix-project-final.appspot.com",
            messagingSenderId: "220649432033",
            appId: "1:220649432033:web:8ea526def74c1be823e8a0"));
  } else {
    await Firebase.initializeApp();
  }
}
