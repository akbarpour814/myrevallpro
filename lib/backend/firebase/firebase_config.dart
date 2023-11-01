import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCyPQNRa7hLuEHr1tggvht9gV5kK1tHjXI",
            authDomain: "taskerpage-2.firebaseapp.com",
            projectId: "taskerpage-2",
            storageBucket: "taskerpage-2.appspot.com",
            messagingSenderId: "527884613740",
            appId: "1:527884613740:web:e8f23919789df71ca10049",
            measurementId: "G-TGG4G6SMH4"));
  } else {
    await Firebase.initializeApp();
  }
}
