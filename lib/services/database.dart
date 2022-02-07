import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference fundraiserCollection =
      FirebaseFirestore.instance.collection('fundraisers');

  Future updateUserData(String requestTitle, String requestDescription,
      String requestImage, String phone, int amount, int amountDonated) async {
    return await fundraiserCollection.doc(uid).set({
      'requestTitle': requestTitle,
      'requestDescription': requestDescription,
      'requestImage': requestImage,
      'phone': phone,
      'amount': amount,
      'amountDonated': amountDonated,
    });
  }
}
