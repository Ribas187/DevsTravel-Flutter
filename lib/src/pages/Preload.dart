import 'package:DevsTravel/src/models/appdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      loading = true;
    });

    bool req = await Provider.of<AppData>(context, listen: false).requestData();

    if (!req) {
      setState(() {
        loading = false;
      });

      return;
    }

    Navigator.pushReplacementNamed(context, '/home');
  }

  void initState() {
    super.initState();

    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/logo.png',
              width: 200,
            ),
            loading
                ? Container(
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      'Carregando Informações...',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : Container(),
            loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  )
                : Container(),
            !loading
                ? Container(
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    child: RaisedButton(
                      child: Text('Tentar novamente'),
                      onPressed: () {},
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
