import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/core/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseService {
  static CollectionReference<EventDm> getCollectionRef(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventDm> eventCollection = db
        .collection("events")
        .withConverter<EventDm>(
          fromFirestore:
              (snapshot, options) => EventDm.fromJson(snapshot, context),
          toFirestore: (event, options) => event.toJson(),
        );
    return eventCollection;
  }

  static CollectionReference<UserDm> getUserCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserDm> userCollection = db
        .collection("users")
        .withConverter<UserDm>(
          fromFirestore: (snapshot, options) => UserDm.fromJson(snapshot),
          toFirestore: (user, options) => user.toJson(),
        );
    return userCollection;
  }

  static Future<void> addEvent(EventDm event) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference eventCollection = db.collection("events");
    DocumentReference eventDoc = eventCollection.doc();
    event.eventID = eventDoc.id;
    eventDoc.set(event.toJson());
  }

  static Stream<List<EventDm>> getDataRealTime(
    BuildContext context,
    String categoryId,
  ) async* {
    CollectionReference<EventDm> eventCollection = getCollectionRef(context);
    Stream<QuerySnapshot<EventDm>> eventsSnapShots =
        eventCollection
            .where(
              kEventCategory,
              isEqualTo: int.parse(categoryId) == 0 ? null : categoryId,
            )
            .orderBy(kEventEventDate, descending: true)
            .snapshots();
    Stream<List<EventDm>> events = eventsSnapShots.map(
      (event) => event.docs.map((e) => e.data()).toList(),
    );

    yield* events;
  }

  static Future<UserCredential> createAccount(
    String userName,
    String emailAddress,
    String password,
  ) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
    UserDm user = UserDm(
      userID: credential.user!.uid,
      userName: userName,
      email: emailAddress,
      favoritesList: [],
    );
    await addUserToFireStore(user);
    return credential;
  }

  static Future<void> addUserToFireStore(UserDm user) async {
    CollectionReference<UserDm> userCollection = getUserCollection();
    DocumentReference<UserDm> userDoc = userCollection.doc(user.userID);
    await userDoc.set(user);
  }

  static Future<UserCredential> userLogin(String email, String password) async {
    UserCredential currentUser = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    UserDm.currentUser = await getUserFromDocsByID(currentUser.user!.uid);

    return currentUser;
  }

  static Future<UserDm> getUserFromDocsByID(String userID) async {
    CollectionReference<UserDm> userCollection = getUserCollection();
    DocumentReference<UserDm> userReference = userCollection.doc(userID);
    DocumentSnapshot<UserDm> userSnapshot = await userReference.get();
    return userSnapshot.data()!;
  }

  static Future<void> addEventToFavoritesList(String eventID) async {
    List<String> userFavorites = UserDm.currentUser!.favoritesList;
    userFavorites.add(eventID);
    UserDm.currentUser!.favoritesList = userFavorites;
    addUserToFireStore(UserDm.currentUser!);
  }

  static Future<void> removeEventFromFavoritesList(String eventID) async {
    List<String> userFavorites = UserDm.currentUser!.favoritesList;
    userFavorites.remove(eventID);
    UserDm.currentUser!.favoritesList = userFavorites;
    addUserToFireStore(UserDm.currentUser!);
  }

  static Future<void> deleteSelectEvent(
    String eventID,
    BuildContext context,
  ) async {
    CollectionReference<EventDm> events = getCollectionRef(context);
    await events.doc(eventID).delete();
  }

  static Future<void> updateSelectEvent(
    BuildContext context,
    EventDm event,
  ) async {
    CollectionReference<EventDm> events = getCollectionRef(context);
    await events.doc(event.eventID).set(event);
  }

  static Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser ==null)return;

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential googleCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    addUserToFireStore(
      UserDm(
        userID: googleCredential.user!.uid,
        userName: googleCredential.user!.displayName!,
        email: googleCredential.user!.email!,
        favoritesList: [],
      ),
    );
    UserDm.currentUser = await getUserFromDocsByID(googleCredential.user!.uid);
  }
}
