class Request {
  String requestTitle;
  String requestImage;
  String requestDescription;

  Request(
    this.requestTitle,
    this.requestImage,
    this.requestDescription,
  );

//a hard coded list of donation requests
  static List<Request> samples = [
    Request(
      'Request 1',
      'images/request1.jpg',
      'This is the description of request 1fjkgsghjkhfghjkertyuiosdjdkskshjkswnyetyuicvbnrtyusdfghjcvbncvbnmfghjcvbnmcvbnmvbnmghjkuiertyuirtyuityuivbnmghjkvbnmvbnrtyuiodfghjkrtyuioefaghjkvdbsnmdghsjklghjkldsghjklfbnmewfghjkdfghjkdfghjdfghjkdfghjkdfghjfghjfhjfghdfghjdfghjjkfghjfghjfghjfghjfghjdfghjfghjkfghjfghjghjkcvbnmrtyuidfghjvbnmrtyuvbntyuifghjksdjkertyuiodjkfghjkdfghjbncvbnmsdfghjertyuinmdfghjketyuicvbndfcvbnhjkbncvbfghhfghfghfghfhjfghvbdfghyuifghjvbn ',
    ),
    Request(
      'New Ward For our Health Centre',
      'images/request2.jpg',
      'We have spent around 2 years in the pandemic of Covid-19. It is clear other health issues have been ignored. \nDonate and help our health centre get a new ward  ',
    ),
    Request(
      'New Class Block',
      'images/request3.jpg',
      'This is the description of request 3 ',
    ),
    Request(
      'Request 4',
      'images/request4.jpg',
      'This is the description of request 4 ',
    ),
    Request(
      'Request 5',
      'images/request5.jpg',
      'This is the description of request 5 ',
    ),
  ];
}
