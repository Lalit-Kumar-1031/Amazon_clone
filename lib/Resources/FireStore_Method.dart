import 'package:amazon_clone/Models/UserDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreMethod
{
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  Future UploadNamenadAddressToDatabase({required UserDetailsModel user})async{

    await firestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(user.getJson());
  }
}