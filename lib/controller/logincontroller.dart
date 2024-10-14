import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/model/authentication/usermodel.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/Loginpage/loginwithmobile/save_username.dart';
import 'package:real_estate/views/bottom_navbar/bottom_nav.dart';
import 'package:real_estate/views/emailverifcation.dart';
import 'package:real_estate/views/widgets/snackbar/errorsnckbar.dart';
import 'package:real_estate/views/widgets/snackbar/successsnackbar.dart';

import '../views/Loginpage/loginwithmobile/otpverify.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController logemailController = TextEditingController();
  final TextEditingController logpasswordController = TextEditingController();
  TextEditingController resetPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();

  final RxBool isFullNameFocused = false.obs;
  final RxBool isEmailFocused = false.obs;
  final RxBool isPasswordFocused = false.obs;
  final RxBool isConfirmPasswordFocused = false.obs;
  final formKey = GlobalKey<FormState>();
  final signupformKey = GlobalKey<FormState>();
  final mobileformKey = GlobalKey<FormState>();
  final usernameformKey = GlobalKey<FormState>();
  // RxBool to manage password visibility
  final RxBool isPasswordVisible = false.obs;
  final isTextTapped = false.obs;
  //var image = Rx<File?>(null);
  //var imgUrl = Rx<String?>(null);
  File? image;
  String? imgUrl;
  String verifyId = "";
  bool userWithNumExists = false;
  Rx<bool?> isAgree = Rx<bool?>(null);
  var loading = false.obs;
  var isEmailVerified = false.obs;
  RxString username = "".obs;
  Rx<bool> emailVerified = Rx<bool>(false);
  String userId = "";
  String? notificationToken;
  //create account with email and password

  var otpDigits = List.generate(6, (index) => ''.obs);
  var isSubmitting = false.obs;

  // OTP Handling
  void setOtpDigit(int index, String value) {
    otpDigits[index].value = value;
  }

  String get completeOtp => otpDigits.map((e) => e.value).join();

  // Future<void> verifyOtp() async {
  //   isSubmitting.value = true;
  //   await Future.delayed(Duration(seconds: 2)); // Simulate network call
  //   isSubmitting.value = false;
  //   if (completeOtp == "123456") { // Example check
  //     Get.snackbar('Success', 'OTP Verified');
  //   } else {
  //     Get.snackbar('Error', 'Invalid OTP');
  //   }
  // }

  // Future<void> resendOtp() async {
  //   isSubmitting.value = true;
  //   await Future.delayed(Duration(seconds: 2)); // Simulate network call
  //   isSubmitting.value = false;
  //   Get.snackbar('Success', 'OTP Resent');
  // }

  Future<User?> signUp({
    required String userName,
    required String userEmail,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    loading.value = true;

    if (userName.isEmpty || userEmail.isEmpty) {
      errorSnackBar(message: "Please enter your name and email");
      loading.value = false;
      return null;
    }
    // Check if password and confirmPassword match
    if (password != confirmPassword) {
      errorSnackBar(message: "Passwords do not match.");
      loading.value = false;
      return null;
    } else if (password.isEmpty) {
      errorSnackBar(title: "", message: "Please enter a password");
      loading.value = false;
      return null;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userEmail, password: password);

      // Send email verification
      await userCredential.user!.sendEmailVerification();

      Get.to(() => const EmailVerificationPage());

      // Update the username
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(userName);
        await user.reload();
        username.value = userName;

        await addUser(UserModel(
          userName: userName,
          email: emailController.text,
          password: password,
          notificationToken: notificationToken,
          id: auth.currentUser!.uid,
          chatWith: [],
          imageUrl: imgUrl,
        ));
        loading.value = false;
        return user;
      }
    } on FirebaseAuthException catch (e) {
      loading.value = false;
      if (e.code == 'weak-password') {
        errorSnackBar(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        errorSnackBar(
            title: '', message: 'The account already exists for that email.');
      }
      return null;
    } catch (e) {
      loading.value = false;
      debugPrint(e.toString());
      return null;
    }
    loading.value = false;
    return null;
  }

  passwordReset() async {
    try {
      await auth.sendPasswordResetEmail(
        email: resetPassword.text.trim(),
      );
      successSnackbar('Success', 'Password reset link sent to your email.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorSnackBar(message: 'No user found for that email.');
      }
    }
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isEmailVerified.value) {
      successSnackbar('Success', 'Email Successfully Verified.');
      Get.offAll(() => BottomNavbar());
    } else {
      successSnackbar('', 'Please verify your email. Check your mail');
    }
  }

  //add user to database
  addUser(UserModel user) async {
    await db.collection("users").add(user.toMap());
  }

  //Sign out
  signOut() async {
    await auth.signOut();
    notificationToken = null;
    imgUrl = null;
    fullNameController.clear();
  }

  //sign in
  signIn() async {
    if (logemailController.text.isEmpty) {
      errorSnackBar(title: "Error", message: "Please enter your email");
      return null;
    }
    // Check if password and confirmPassword match
    if (logpasswordController.text.isEmpty) {
      errorSnackBar(title: "Error", message: "Please enter a password");
      //  loading.value = true;
      return null;
    }
    try {
      loading.value = true;

      await auth.signInWithEmailAndPassword(
          email: logemailController.text, password: logpasswordController.text);

      Get.offAll(() => BottomNavbar());
      loading.value = false;
    } catch (e) {
      errorSnackBar(message: "Incorrect user details");
      loading.value = false;
    }
  }

  //sign in with google
  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      // Sign out from Google to force account selection
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          // Check if the user exists in Firestore
          QuerySnapshot userQuery = await db
              .collection('users')
              .where('id', isEqualTo: user.uid)
              .get();
          if (userQuery.docs.isEmpty) {
            // If user does not exist, create a new user in Firestore
            await addUser(UserModel(
              userName: user.displayName,
              email: user.email,
              notificationToken:
                  notificationToken, // replace with your actual token variable
              id: user.uid,
              chatWith: [],
            ));
          }

          // Navigate to BottomNavBar
          Get.offAll(() => BottomNavbar());
        }
      }
    } catch (e) {
      errorSnackBar(title: "Error", message: "$e");
      // print("---------------------------------");
      // print(e.toString());
    }
  }

  // sentOtp() async {
  //   try {
  //     //check if a user with the given phone number already exists

  //     QuerySnapshot snapshot = await db
  //         .collection('users')
  //         .where('phoneNumber', isEqualTo: '+91${phoneNumber.text}')
  //         .get();

  //     if (snapshot.docs.isNotEmpty) {
  //       // If a user with the given phone number already exists, retrieve their name from the database
  //       userWithNumExists = true;
  //       // DocumentSnapshot userDoc = snapshot.docs.first;
  //       // String userName = userDoc['name'];

  //       successSnackbar('Success', 'OTP sent to + 91 ${phoneNumber.text}');

  //       await auth.verifyPhoneNumber(
  //           phoneNumber: "+91${phoneNumber.text}",
  //           verificationCompleted: (PhoneAuthCredential credential) async {
  //             // Handle automatic verification
  //           },
  //           verificationFailed: (FirebaseAuthException e) {
  //             // Handle verification failure
  //             if (e.code == 'invalid-phone-number') {
  //               errorSnackBar(
  //                   'Error', 'The provided phone number is not valid.');
  //             } else {
  //               errorSnackBar('Error', 'An error occurred. ${e.toString()}');
  //             }
  //           },
  //           codeSent: (String verificationId, [int? resendToken]) {
  //             verifyId = verificationId;
  //             // Handle code sent
  //             successSnackbar(
  //                 'Success', 'OTP sent to + 91 ${phoneNumber.text}');
  //             Get.to(() => OtpVerificationPage());
  //           },
  //           codeAutoRetrievalTimeout: (String verificationId) {
  //             // Handle auto-retrieval timeout
  //           });
  //     } else {
  //       // If a user with the given phone number does not exist, proceed with sending the OTP and verifying it as before
  //       userWithNumExists = false;
  //       await auth.verifyPhoneNumber(
  //           phoneNumber: "+91${phoneNumber.text}",
  //           verificationCompleted: (PhoneAuthCredential credential) async {
  //             User? user = auth.currentUser;
  //             if (user == null) {
  //               // Create a new user
  //               UserCredential userCredential =
  //                   await auth.signInWithCredential(credential);
  //               User? newUser = userCredential.user;
  //               if (newUser != null) {
  //                 // Add the new user to the Firestore database
  //                 await db.collection('users').doc(newUser.uid).set({
  //                   'phoneNumber': newUser.phoneNumber,
  //                   'name': fullNameController.text, // Add the user's name here
  //                   'createdAt': Timestamp.now(),
  //                   'id': auth.currentUser!.uid,
  //                   'notificationToken': notificationToken,
  //                 });
  //               }
  //             }
  //           },
  //           verificationFailed: (FirebaseAuthException e) {
  //             // Handle verification failure
  //             if (e.code == 'invalid-phone-number') {
  //               errorSnackBar(
  //                   'Error', 'The provided phone number is not valid.');
  //             } else {
  //               errorSnackBar('Error', 'An error occurred. ${e.toString()}');
  //             }
  //           },
  //           codeSent: (String verificationId, [int? resendToken]) {
  //             verifyId = verificationId;
  //             // Handle code sent
  //             successSnackbar(
  //                 'Success', 'OTP sent to + 91 ${phoneNumber.text}');
  //             Get.to(() => OtpVerificationPage());
  //           },
  //           codeAutoRetrievalTimeout: (String verificationId) {
  //             // Handle auto-retrieval timeout
  //           });
  //     }
  //   } catch (e) {
  //     errorSnackBar('Error', e.toString());
  //   }
  // }

  sentOtp() async {
    try {
      //check if a user with the given phone number already exists
      QuerySnapshot snapshot = await db
          .collection('users')
          .where('phoneNumber', isEqualTo: '+91${phoneNumber.text}')
          .get();

      if (snapshot.docs.isNotEmpty) {
        // If a user with the given phone number already exists, retrieve their name from the database
        userWithNumExists = true;
        // DocumentSnapshot userDoc = snapshot.docs.first;
        // String userName = userDoc['name'];

        successSnackbar('Success', 'OTP sent to + 91 ${phoneNumber.text}');

        await auth.verifyPhoneNumber(
            phoneNumber: "+91${phoneNumber.text}",
            verificationCompleted: (PhoneAuthCredential credential) async {
              // Handle automatic verification
            },
            verificationFailed: (FirebaseAuthException e) {
              // Handle verification failure
              if (e.code == 'invalid-phone-number') {
                errorSnackBar(
                    message: 'The provided phone number is not valid.');
              } else {
                errorSnackBar(
                    title: 'Error',
                    message: 'An error occurred. ${e.toString()}');
              }
            },
            codeSent: (String verificationId, [int? resendToken]) {
              verifyId = verificationId;
              // Handle code sent
              successSnackbar(
                  'Success', 'OTP sent to + 91 ${phoneNumber.text}');
              Get.to(() => OtpVerificationPage());
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              // Handle auto-retrieval timeout
            });
      } else {
        // If a user with the given phone number does not exist, proceed with sending the OTP and verifying it as before
        userWithNumExists = false;
        await auth.verifyPhoneNumber(
            phoneNumber: "+91${phoneNumber.text}",
            verificationCompleted: (PhoneAuthCredential credential) async {
              User? user = auth.currentUser;
              if (user == null) {
                // Create a new user
                UserCredential userCredential =
                    await auth.signInWithCredential(credential);
                User? newUser = userCredential.user;
                if (newUser != null) {
                  // Add the new user to the Firestore database
                  await db.collection('users').doc(newUser.uid).set({
                    'phoneNumber': newUser.phoneNumber,
                    'name': fullNameController.text, // Add the user's name here
                    'createdAt': Timestamp.now(),
                    'id': auth.currentUser!.uid,
                    'notificationToken': notificationToken,
                  });
                }
              }
            },
            verificationFailed: (FirebaseAuthException e) {
              // Handle verification failure
              if (e.code == 'invalid-phone-number') {
                errorSnackBar(
                    message: 'The provided phone number is not valid.');
              } else {
                errorSnackBar(message: 'An error occurred. ${e.toString()}');
              }
            },
            codeSent: (String verificationId, [int? resendToken]) {
              verifyId = verificationId;
              // Handle code sent
              successSnackbar(
                  'Success', 'OTP sent to + 91 ${phoneNumber.text}');
              Get.to(() => OtpVerificationPage());
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              // Handle auto-retrieval timeout
            });
      }
    } catch (e) {
      errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  verifyOtp() async {
    final cred = PhoneAuthProvider.credential(
        verificationId: verifyId, smsCode: completeOtp);
    try {
      final user = await auth.signInWithCredential(cred);
      if (user.user != null) {
        successSnackbar("Success", "OTP verified");
        //
        // Get.offAll(() => BottomNavbar());

        if (auth.currentUser!.displayName != null) {
          //
          Get.offAll(() => BottomNavbar());
        } else {
          Get.offAll(() => SaveUsername());
          //saveUserNameNum();
        }
      } else {
        errorSnackBar(message: "OTP not verified");
      }
    } on FirebaseAuthException catch (e) {
      errorSnackBar(title: "Error", message: e.toString());
    } catch (e) {
      errorSnackBar(title: "Error", message: e.toString());
    }
  }

  saveUserNameNum() async {
    if (fullNameController.text.isEmpty) {
      errorSnackBar(title: "", message: "Please enter a username");
      return;
    }
    if (auth.currentUser!.displayName == null) {
      await auth.currentUser!.updateDisplayName(fullNameController.text);
      addUser(UserModel(
        userName: fullNameController.text,
        email: phoneNumber.text,
        id: auth.currentUser!.uid,
        notificationToken: notificationToken,
        chatWith: [],
      ));
      successSnackbar("Success", "username has been saved");
      Get.offAll(() => BottomNavbar());
    }
  }

  Future<void> selectAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // final croppedFile = await cropImage(File(pickedFile.path)) as File;

      image = File(pickedFile.path);

      await uploadImageToFirebase(image!);
    } else {
      errorSnackBar(message: "Image not selected");
    }
  }

  Future<void> takePictureAndUpload() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      print("Picture taken");

      image = File(pickedFile.path);

      await uploadImageToFirebase(image!);
    } else {
      print("No picture taken");
      errorSnackBar(message: "Picture not taken");
    }
  }

  Future<File?> cropImage(File imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Crop Image",
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return null;
    }
  }

  uploadImageToFirebase(File imageFile) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child("${DateTime.now().millisecondsSinceEpoch}");
      // isLoading.value = true;

      final result = await ref.putFile(imageFile);

      final fileUrl = await result.ref.getDownloadURL();
      imgUrl = fileUrl;
      update();
      print("Uploaded image URL: $imgUrl");
      successSnackbar("Success", 'Image successfully saved');
    } catch (e) {
      errorSnackBar(message: 'Error in uploading image $e');
    }
  }

  editUserDetails() async {
    await auth.currentUser!.updateDisplayName(fullNameController.text);
    try {
      // Query Firestore to find the document with the matching user ID

      QuerySnapshot querySnapshot = await db
          .collection('users')
          .where('id', isEqualTo: auth.currentUser!.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assume the first matching document is the one we want
        DocumentSnapshot userDoc = querySnapshot.docs.first;

        // Update the document
        await db.collection('users').doc(userDoc.id).update({
          'userName': fullNameController.text,
          'imageUrl': imgUrl,
        });
        update();
        Get.back();

        successSnackbar("Success", 'User updated successfully');
      } else {
        errorSnackBar(message: 'No user found with the provided ID');
      }
    } catch (e) {
      errorSnackBar(title: 'Error', message: 'Error updating user: $e');
    }
  }

  getUserData() async {
    loading.value = true;
    try {
      QuerySnapshot querySnapshot = await db
          .collection('users')
          .where('id', isEqualTo: auth.currentUser!.uid)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        fullNameController.text = data['userName'];
        imgUrl = data['imageUrl'];
        update();
      } else {
        errorSnackBar(message: "No user found with the provided ID.");
      }
    } catch (e) {
      errorSnackBar(title: 'Error', message: e.toString());
    }
    loading.value = false;
  }

  getUserDetailsByUId(String uid) async {
    if (uid == "") {
      errorSnackBar(
          title: "Error", message: "Something went wrong. Please try again");
      Get.back();
      return;
    }
    try {
      QuerySnapshot querySnapshot =
          await db.collection('users').where('id', isEqualTo: uid).get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        return [
          data['userName'],
          data['imageUrl'],
          data['id'],
          data['notificationToken']
        ];
      }
    } catch (e) {
      errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUserData();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   fullNameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   confirmPasswordController.dispose();
  //   super.onClose();
  // }

  // Signup logic

  // Login logic

  void toggleTextTap() {
    isTextTapped.value = !isTextTapped.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
