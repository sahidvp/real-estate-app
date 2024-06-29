// import 'dart:async';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';


// class AuthController extends GetxController {
  
  
  
//   String? imgUrl;
//   String verifyId = "";
//   bool userWithNumExists = false;
//   Rx<bool?> isAgree = Rx<bool?>(null);
//   var loading = false.obs;
//   var isEmailVerified = false.obs;
//   RxString username = "".obs;
//   Rx<bool> emailVerified = Rx<bool>(false);
//   String userId = "";
//   String? notificationToken;
//   //create account with email and password
//   Future<User?> signUp({
//     required String userName,
//     required String userEmail,
//     required String password,
//     required String confirmPassword,
//     required BuildContext context,
//   }) async {
//     loading.value = true;

//     if (userName.isEmpty || userEmail.isEmpty) {
//       errorSnackBar("Error", "Please enter your name and email");
//       loading.value = false;
//       return null;
//     }
//     // Check if password and confirmPassword match
//     if (password != confirmPassword) {
//       errorSnackBar("Error", "Passwords do not match.");
//       loading.value = false;
//       return null;
//     } else if (password.isEmpty) {
//       errorSnackBar("Error", "Please enter a password");
//       loading.value = false;
//       return null;
//     }

//     if (isAgree.value == false) {
//       errorSnackBar("Error", "Please accept terms and conditions.");
//       loading.value = false;
//       return null;
//     }
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: userEmail, password: password);

// // Send email verification
//       await userCredential.user!.sendEmailVerification();
//       // Update the username
//       User? user = userCredential.user;
//       if (user != null) {
//         await user.updateDisplayName(userName);
//         await user.reload();
//         username.value = userName;

//         await addUser(UserModel(
//           userName: userName,
//           email: email.text,
//           password: password,
//           notificationToken: notificationToken,
//           id: auth.currentUser!.uid,
//           chatWith: [],
//           imageUrl: imgUrl,
//         ));
//         loading.value = false;
//         return user;
//       }
//     } on FirebaseAuthException catch (e) {
//       loading.value = false;
//       if (e.code == 'weak-password') {
//         errorSnackBar('Error', 'The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         errorSnackBar('Error', 'The account already exists for that email.');
//       }
//       return null;
//     } catch (e) {
//       loading.value = false;
//       debugPrint(e.toString());
//       return null;
//     }
//     loading.value = false;
//     return null;
//   }

//   passwordReset() async {
//     try {
//       await auth.sendPasswordResetEmail(
//         email: resetPassword.text.trim(),
//       );
//       successSnackbar('Success', 'Password reset link sent to your email.');
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         errorSnackBar('Error', 'No user found for that email.');
//       }
//     }
//   }

//   checkEmailVerified() async {
//     await FirebaseAuth.instance.currentUser?.reload();
//     isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;

//     if (isEmailVerified.value) {
//       successSnackbar('Success', 'Email Successfully Verified.');
//       Get.offAll(() => BottomNavBar());
//     } else {
//       errorSnackBar('Error', 'Please verify your email. Check your mail');
//     }
//   }

//   //add user to database
//   addUser(UserModel user) async {
//     await db.collection("users").add(user.toMap());
//   }

//   //Sign out
//   signOut() async {
//     await auth.signOut();
//     notificationToken = null;
//     imgUrl = null;
//     userName.clear();
//   }

//   //sign in
//   signIn() async {
//     if (loginEmail.text.isEmpty) {
//       errorSnackBar("Error", "Please enter your email");
//       return null;
//     }
//     // Check if password and confirmPassword match
//     if (loginPassword.text.isEmpty) {
//       errorSnackBar("Error", "Please enter a password");
//       //  loading.value = true;
//       return null;
//     }
//     try {
//       loading.value = true;

//       await auth.signInWithEmailAndPassword(
//           email: loginEmail.text, password: loginPassword.text);

//       Get.offAll(() => BottomNavBar());
//       loading.value = false;
//     } catch (e) {
//       errorSnackBar("error", "$e");
//       loading.value = false;
//     }
//   }

//   //sign in with google
//   signInWithGoogle() async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     try {
//       // Sign out from Google to force account selection
//       await googleSignIn.signOut();

//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();

//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;

//         final AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken,
//         );

//         UserCredential userCredential =
//             await auth.signInWithCredential(credential);
//         User? user = userCredential.user;

//         if (user != null) {
//           // Check if the user exists in Firestore
//           QuerySnapshot userQuery = await db
//               .collection('users')
//               .where('id', isEqualTo: user.uid)
//               .get();
//           if (userQuery.docs.isEmpty) {
//             // If user does not exist, create a new user in Firestore
//             await addUser(UserModel(
//               userName: user.displayName,
//               email: user.email,
//               notificationToken:
//                   notificationToken, // replace with your actual token variable
//               id: user.uid,
//               chatWith: [],
//             ));
//           }

//           // Navigate to BottomNavBar
//           Get.offAll(() => BottomNavBar());
//         }
//       }
//     } catch (e) {
//       errorSnackBar("Error", "$e");
//     }
//   }

//   sentOtp() async {
//     try {
//       //check if a user with the given phone number already exists
//       QuerySnapshot snapshot = await db
//           .collection('users')
//           .where('phoneNumber', isEqualTo: '+91${phoneNumber.text}')
//           .get();

//       if (snapshot.docs.isNotEmpty) {
//         // If a user with the given phone number already exists, retrieve their name from the database
//         userWithNumExists = true;
//         // DocumentSnapshot userDoc = snapshot.docs.first;
//         // String userName = userDoc['name'];

//         successSnackbar('Success', 'OTP sent to + 91 ${phoneNumber.text}');

//         await auth.verifyPhoneNumber(
//             phoneNumber: "+91${phoneNumber.text}",
//             verificationCompleted: (PhoneAuthCredential credential) async {
//               // Handle automatic verification
//             },
//             verificationFailed: (FirebaseAuthException e) {
//               // Handle verification failure
//               if (e.code == 'invalid-phone-number') {
//                 errorSnackBar(
//                     'Error', 'The provided phone number is not valid.');
//               } else {
//                 errorSnackBar('Error', 'An error occurred. ${e.toString()}');
//               }
//             },
//             codeSent: (String verificationId, [int? resendToken]) {
//               verifyId = verificationId;
//               // Handle code sent
//               successSnackbar(
//                   'Success', 'OTP sent to + 91 ${phoneNumber.text}');
//               Get.to(() => OtpVerificationPage());
//             },
//             codeAutoRetrievalTimeout: (String verificationId) {
//               // Handle auto-retrieval timeout
//             });
//       } else {
//         // If a user with the given phone number does not exist, proceed with sending the OTP and verifying it as before
//         userWithNumExists = false;
//         await auth.verifyPhoneNumber(
//             phoneNumber: "+91${phoneNumber.text}",
//             verificationCompleted: (PhoneAuthCredential credential) async {
//               User? user = auth.currentUser;
//               if (user == null) {
//                 // Create a new user
//                 UserCredential userCredential =
//                     await auth.signInWithCredential(credential);
//                 User? newUser = userCredential.user;
//                 if (newUser != null) {
//                   // Add the new user to the Firestore database
//                   await db.collection('users').doc(newUser.uid).set({
//                     'phoneNumber': newUser.phoneNumber,
//                     'name': userName.text, // Add the user's name here
//                     'createdAt': Timestamp.now(),
//                     'id': auth.currentUser!.uid,
//                     'notificationToken': notificationToken,
//                   });
//                 }
//               }
//             },
//             verificationFailed: (FirebaseAuthException e) {
//               // Handle verification failure
//               if (e.code == 'invalid-phone-number') {
//                 errorSnackBar(
//                     'Error', 'The provided phone number is not valid.');
//               } else {
//                 errorSnackBar('Error', 'An error occurred. ${e.toString()}');
//               }
//             },
//             codeSent: (String verificationId, [int? resendToken]) {
//               verifyId = verificationId;
//               // Handle code sent
//               successSnackbar(
//                   'Success', 'OTP sent to + 91 ${phoneNumber.text}');
//               Get.to(() => OtpVerificationPage());
//             },
//             codeAutoRetrievalTimeout: (String verificationId) {
//               // Handle auto-retrieval timeout
//             });
//       }
//     } catch (e) {
//       errorSnackBar('Error', e.toString());
//     }
//   }

//   verifyOtp() async {
//     final cred = PhoneAuthProvider.credential(
//         verificationId: verifyId, smsCode: otp.text);
//     try {
//       final user = await auth.signInWithCredential(cred);
//       if (user.user != null) {
//         successSnackbar("Success", "OTP verified");
//         if (auth.currentUser!.displayName != null) {
//           Get.offAll(() => BottomNavBar());
//         } else {
//           Get.to(() => UserNameNumSignUp());
//           saveUserNameNum();
//         }
//       } else {
//         errorSnackBar("Error", "OTP not verified");
//       }
//     } on FirebaseAuthException catch (e) {
//       errorSnackBar("Error", e.toString());
//     } catch (e) {
//       errorSnackBar("Error", e.toString());
//     }
//   }

//   saveUserNameNum() async {
//     if (userName.text.isEmpty) {
//       errorSnackBar("Error", "Please enter a username");
//       return;
//     }
//     if (auth.currentUser!.displayName == null) {
//       await auth.currentUser!.updateDisplayName(userName.text);
//       addUser(UserModel(
//         userName: userName.text,
//         email: phoneNumber.text,
//         id: auth.currentUser!.uid,
//         notificationToken: notificationToken,
//         chatWith: [],
//       ));
//       successSnackbar("Success", "username has been saved");
//       Get.offAll(() => BottomNavBar());
//     }
//   }

//   uploadImageToFirebase(File imageFile) async {
//     try {
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child("images")
//           .child("${DateTime.now().millisecondsSinceEpoch}");
//       // isLoading.value = true;
//       final result = await ref.putFile(imageFile);
//       final fileUrl = await result.ref.getDownloadURL();
//       imgUrl = fileUrl;
//       print(imgUrl);
//       successSnackbar("Success", 'Image successfully saved');
//     } catch (e) {
//       errorSnackBar("error", 'Error in uploading image $e');
//     }
//   }

//   editUserDetails() async {
//     await auth.currentUser!.updateDisplayName(userName.text);
//     try {
//       // Query Firestore to find the document with the matching user ID

//       QuerySnapshot querySnapshot = await db
//           .collection('users')
//           .where('id', isEqualTo: auth.currentUser!.uid)
//           .get();

//       if (querySnapshot.docs.isNotEmpty) {
//         // Assume the first matching document is the one we want
//         DocumentSnapshot userDoc = querySnapshot.docs.first;

//         // Update the document
//         await db.collection('users').doc(userDoc.id).update({
//           'userName': userName.text,
//           'imageUrl': imgUrl,
//         });
//         update();
//         successSnackbar("Success", 'User updated successfully');
//       } else {
//         errorSnackBar('Error', 'No user found with the provided ID');
//       }
//     } catch (e) {
//       errorSnackBar('Error', 'Error updating user: $e');
//     }
//   }

//   getUserData() async {
//     loading.value = true;
//     try {
//       QuerySnapshot querySnapshot = await db
//           .collection('users')
//           .where('id', isEqualTo: auth.currentUser!.uid)
//           .get();
//       if (querySnapshot.docs.isNotEmpty) {
//         DocumentSnapshot userDoc = querySnapshot.docs.first;
//         Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
//         userName.text = data['userName'];
//         imgUrl = data['imageUrl'];
//       } else {
//         errorSnackBar("Error", "No user found with the provided ID.");
//       }
//     } catch (e) {
//       errorSnackBar('Error', e.toString());
//     }
//     loading.value = false;
//   }

//   getUserDetailsByUId(String uid) async {
//     if (uid == "") {
//       errorSnackBar("Error", "Something went wrong. Please try again");
//       Get.back();
//       return;
//     }
//     try {
//       QuerySnapshot querySnapshot =
//           await db.collection('users').where('id', isEqualTo: uid).get();
//       if (querySnapshot.docs.isNotEmpty) {
//         DocumentSnapshot userDoc = querySnapshot.docs.first;
//         Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
//         return [
//           data['userName'],
//           data['imageUrl'],
//           data['id'],
//           data['notificationToken']
//         ];
//       }
//     } catch (e) {
//       errorSnackBar('Error', e.toString());
//     }
//   }
// }