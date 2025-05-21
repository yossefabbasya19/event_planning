import 'package:cloud_firestore/cloud_firestore.dart';

class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class FireBaseFailure extends Failure {
  FireBaseFailure(super.errMessage);

  factory FireBaseFailure.fromCreateAccount(
    FirebaseException firebaseException,
  ) {
    if (firebaseException.code == 'weak-password') {
      return FireBaseFailure('The password provided is too weak.');
    } else if (firebaseException.code == 'email-already-in-use') {
      FireBaseFailure('The account already exists for that email.');
    }
    return FireBaseFailure(firebaseException.code);
  }

  factory FireBaseFailure.fromLoginAccount(
    FirebaseException firebaseException,
  ) {
    if (firebaseException.code == 'user-not-found') {
      return FireBaseFailure('No user found for that email.');
    } else if (firebaseException.code == 'wrong-password') {
      return FireBaseFailure('Wrong password provided for that user.');
    }
    return FireBaseFailure(firebaseException.code);
  }
}
