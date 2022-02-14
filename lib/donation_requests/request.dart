class Request {
  final String requestTitle;
  final String requestImage;
  final String requestDescription;
  final int amount;
  final int amountDonated;
  final String phone;

  Request({
    required this.requestTitle,
    required this.requestDescription,
    required this.requestImage,
    required this.phone,
    required this.amount,
    required this.amountDonated,
  });

}
