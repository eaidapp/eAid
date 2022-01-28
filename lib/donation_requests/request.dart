class Request {
  String requestTitle;
  String requestImage;
  String requestSummary;
  String requestDescription;

  Request(
    this.requestTitle,
    this.requestImage,
    this.requestSummary,
    this.requestDescription,
  );

//a hard coded list of donation requests
  static List<Request> samples = [
    Request(
      'Request 1',
      'images/request1.jpg',
      'This is the summary of request 1hdjdkkdkdljshskdkdjsksllhjkhjksdfghjkghjkldjdjfjfjjienhkdoeifmdmsk',
      'This is the description of request 1fjkgsghjkhfghjkertyuiosdjdkskshjkswnyetyuicvbnrtyusdfghjcvbncvbnmfghjcvbnmcvbnmvbnmghjkuiertyuirtyuityuivbnmghjkvbnmvbnrtyuiodfghjkrtyuioefaghjkvdbsnmdghsjklghjkldsghjklfbnmewfghjkdfghjkdfghjdfghjkdfghjkdfghjfghjfhjfghdfghjdfghjjkfghjfghjfghjfghjfghjdfghjfghjkfghjfghjghjkcvbnmrtyuidfghjvbnmrtyuvbntyuifghjksdjkertyuiodjkfghjkdfghjbncvbnmsdfghjertyuinmdfghjketyuicvbndfcvbnhjkbncvbfghhfghfghfghfhjfghvbdfghyuifghjvbn ',
    ),
    Request(
      'Request 2',
      'images/request2.jpg',
      'This is the summary of request 2',
      'This is the description of request 2 ',
    ),
    Request(
      'Request 3',
      'images/request3.jpg',
      'This is the summary of request 3',
      'This is the description of request 3 ',
    ),
    Request(
      'Request 4',
      'images/request4.jpg',
      'This is the summary of request 4',
      'This is the description of request 4 ',
    ),
    Request(
      'Request 5',
      'images/request5.jpg',
      'This is the summary of request 5',
      'This is the description of request 5 ',
    ),
  ];
}
