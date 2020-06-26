class AlertRequest {
  final String title;
  final String description;
  final String buttonTitle;

  AlertRequest({
    this.title,
    this.description,
    this.buttonTitle,
  });
}

class AlertResponse {
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;

  AlertResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}
