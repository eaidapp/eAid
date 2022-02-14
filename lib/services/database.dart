import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaid/account/account.dart';
import 'package:eaid/donation_requests/request.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference requestCollection =
      FirebaseFirestore.instance.collection('fundraisers');

  Future updateUserData(String requestTitle, String requestDescription,
      String requestImage, String phone, int amount, int amountDonated) async {
    return await requestCollection.doc(uid).set({
      'requestTitle': requestTitle,
      'requestDescription': requestDescription,
      'requestImage': requestImage,
      'phone': phone,
      'amount': amount,
      'amountDonated': amountDonated,
    });
  }

  //request list from snapshot
  List<Request> _requestListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Request(
        requestTitle: (doc.data() as dynamic)['requestTitle'] ?? '',
        requestDescription: (doc.data() as dynamic)['requestDescription'] ?? '',
        requestImage: (doc.data() as dynamic)['requestImage'] ?? '',
        phone: (doc.data() as dynamic)['phone'] ?? '',
        amount: (doc.data() as dynamic)['amount'] ?? 0,
        amountDonated: (doc.data() as dynamic)['amountDonated'] ?? 0,
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid ?? '',
      requestTitle: (snapshot.data() as dynamic)['requestTitle'] ?? '',
      requestDescription:
          (snapshot.data() as dynamic)['requestDescription'] ?? '',
      requestImage: (snapshot.data() as dynamic)['requestImage'] ?? '',
      phone: (snapshot.data() as dynamic)['phone'] ?? '',
      amount: (snapshot.data() as dynamic)['amount'] ?? 1,
      amountDonated: (snapshot.data() as dynamic)['amountDonated'] ?? 0,
    );
  }

  //get request stream
  Stream<List<Request>> get requests {
    return requestCollection.snapshots().map(_requestListFromSnapshot);
  }

  //get user document stream
  Stream<UserData> get userData {
    return requestCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
