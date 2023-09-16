import 'dart:convert';

import 'package:http/http.dart' as http;
class networkHelper{
  final String? url;

  networkHelper(this.url);

  Future getData() async{

    http.Response response = await http.get(Uri.parse(url!));

    if(response.statusCode==200){
      String data=response.body;

      var decodedata=jsonDecode(data);
      return decodedata;
    }else{
      print(response.statusCode);
    }
    }

  }
