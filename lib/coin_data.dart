import 'package:http/http.dart' as http;
import 'price_screen.dart';
import 'dart:convert';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=17617621-2B78-4809-BACE-380E35BA9FCA';
    http.Response response = await http.get(Uri.parse(url));
    // print(response.body);
    if(response.statusCode==200){
      var decodedData = jsonDecode(response.body);

      var lastPrice = decodedData['rate'];
      return lastPrice.toStringAsFixed(0);
    }else{
      print(response.statusCode);
    }
  }

}

