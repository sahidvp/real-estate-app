import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final Future<FirebaseApp> firebaseintialisation = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;
