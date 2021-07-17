import 'dart:convert';
import 'dart:io';

class ApiClient {
  final client = HttpClient();

  Future<dynamic> getProducts() async {
    final url = Uri.parse('https://mdatest2.herokuapp.com/api/products/');
    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;

    return json;
  }
}
