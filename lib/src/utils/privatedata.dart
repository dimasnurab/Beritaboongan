// ApiKey

class PrivateData {
  String _apiKey;

  String get apiKey => _apiKey;

  PrivateData._(this._apiKey);

  factory PrivateData.getApikey() {
    return PrivateData._('4e36ec1ed77f496e99c666f35c5f3828');
  }
}
