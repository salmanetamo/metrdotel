import 'dart:convert';

extension JsonEncoding on Map {
  String encode(){
    return jsonEncode(this);
  }
}
