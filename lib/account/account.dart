class Account {
  final String uid;
  Account({required this.uid});
}

class UserData {
  final String uid;
  final String requestTitle;
  final String requestImage;
  final String requestDescription;
  final int amount;
  final int amountDonated;
  final String phone;

  UserData({
    required this.uid,
    required this.requestTitle,
    required this.requestDescription,
    required this.requestImage,
    required this.phone,
    required this.amount,
    required this.amountDonated,
  });
}
