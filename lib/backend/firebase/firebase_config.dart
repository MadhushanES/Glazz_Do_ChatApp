import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyATLHY8wx6qfbLqmZ8GdkwxGS5CJj95krU",
            authDomain: "glazz-do.firebaseapp.com",
            projectId: "glazz-do",
            storageBucket: "glazz-do.appspot.com",
            messagingSenderId: "258333598834",
            appId: "1:258333598834:web:0630be221ab11ab9f4ceeb",
            measurementId: "G-30M934ZNEH"));
  } else {
    await Firebase.initializeApp();
  }
}
