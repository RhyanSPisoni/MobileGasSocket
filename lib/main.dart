import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showImage1 = true;
  String gif1Path = 'assets/fogo.gif';
  String gif2Path = 'assets/safe.gif';

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (_) => fetchData());
  }

  void fetchData() async {
    var url = Uri.parse('http://192.168.15.6:5000/teste');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      bool done = jsonData['done'];
      setState(() {
        showImage1 = done;
      });
    } else {
      print('Erro na requisição: ${response.statusCode}');
      showImage1 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Center(
        child: showImage1 ? Image.asset(gif1Path) : Image.asset(gif2Path),
      ),
    );
  }
}
