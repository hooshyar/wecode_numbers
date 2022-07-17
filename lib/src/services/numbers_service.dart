import 'package:http/http.dart' as http;

class Services {
  Future<String> getNumberInformation(String number) async {
    http.Response getData =
        await http.get(Uri.parse("http://numbersapi.com/$number"));
    return getData.body;
  }
}
