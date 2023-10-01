import 'dart:convert';

import 'package:http/http.dart' as http;

class CustomHttp {
  // ベースURL
  static const String _baseUrl =
      'https://madefor.github.io/postal-code-api/v1/';

  // ヘッダー指定
  static final Map<String, String> _customHeader = {
    'content-type': 'application/json',
  };

  Future<http.Response> get({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    final url = Uri.parse(_baseUrl + path).replace(queryParameters: query);
    final response = await http.get(url, headers: _customHeader);
    // キャスト時の型がAPIによって異なるため呼び出し元でキャスト
    return response;
  }

  /// new-meのPOST関数
  Future<http.Response> post({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    final url = Uri.parse(_baseUrl + path);
    final bodyQuery = jsonEncode(query);
    final response =
        await http.post(url, headers: _customHeader, body: bodyQuery);

    // キャスト時の型がAPIによって異なるため呼び出し元でキャスト
    return response;
  }

  /// レスポンスのステータスチェック
  bool statusCheck(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return true;
      default:
        return false;
    }
  }
}
