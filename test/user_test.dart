import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:harry_potter_with_pagination/core/apis.dart';
import 'package:harry_potter_with_pagination/model/user_convert_model.dart';
import 'package:harry_potter_with_pagination/services/network.dart';

void main() {
  group('Testing', () {
    test("Data Book", () async{
      final response = await Network.methodGet(api: Apis.apiUsers, baseUrl: Apis.urlUser);
      final json = jsonDecode(response!);
      final dataModel = Todo.fromJson(json as Map<String, dynamic>);

      expect(dataModel, isNotNull);
    });
  });
}
