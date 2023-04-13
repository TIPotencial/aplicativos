import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController _webViewController;
  String _url =
      'http://chamados.potencialflorestal.com.br/glpi/marketplace/formcreator/front/formdisplay.php?id=1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Chamados Potencial Florestal'),
          backgroundColor: Color.fromRGBO(0, 168, 89, 1),
          actions: [
            IconButton(
                onPressed: () {
                  _closeApp();
                },
                icon: Icon(Icons.close)),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color.fromRGBO(0, 168, 89, 1),
          label: Text("Home"),
          icon: Icon(Icons.home),
          onPressed: () {
            _webViewController.loadUrl(_url);
          },
        ),
        body: _body());
  }

  _body() {
    return Container(
      // padding: EdgeInsets.only(top: 32),
      // margin: EdgeInsets.only(top: 32),
      child: WebView(
        initialUrl: _url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
    );
  }

  void _closeApp() {
    SystemNavigator.pop();
  }
}
