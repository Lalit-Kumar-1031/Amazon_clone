import 'package:amazon_clone/Models/UserDetails.dart';
import 'package:amazon_clone/Resources/FireStore_Method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationMethod {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FireStoreMethod fireStoreMethod=FireStoreMethod();
  //This Method for User Sign Up
  Future<String> signUpUser(
      {required String name,
      required String address,
      required String email,
      required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something Went Wrong !";

    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailsModel user=UserDetailsModel(name: name, address: address);
        await fireStoreMethod.UploadNamenadAddressToDatabase(user: user);
        output = "success";
      }on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output="Please fill all the field";
    }
    return output;
  }

  Future<String> signInUser({
        required String email,
        required String password}) async {
    email.trim();
    password.trim();
    String output = "Something Went Wrong !";

    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        output = "success";
      }on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output="Please fill all the field";
    }
    return output;
  }

}
