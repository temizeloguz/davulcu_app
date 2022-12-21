import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.deepOrange,
            title: Text(
              "Drum App",
              style: TextStyle(fontSize: 30),
            )),
        body: DrumPage(),
      ),
    );
  }
}

class DrumPage extends StatelessWidget {
  final oynatici = AudioPlayer();

  void sesiCal(String ses) {
    oynatici.play(AssetSource('$ses.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildTextButton('bip', Colors.yellow),
                  ),
                  Expanded(
                    child: buildTextButton('bongo', Colors.blueAccent),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildTextButton('clap1', Colors.red),
                  ),
                  Expanded(
                    child: buildTextButton('crash', Colors.green),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildTextButton('clap2', Colors.cyanAccent),
                  ),
                  Expanded(
                    child: buildTextButton('how', Colors.deepPurple),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildTextButton('ridebel', Colors.brown),
                  ),
                  Expanded(
                    child: buildTextButton('oobah', Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildTextButton(String ses, Color renk) {
    return TextButton(
        style: TextButton.styleFrom(
          enableFeedback: false,
          padding: EdgeInsets.all(8),
        ),
        onPressed: () {
          sesiCal(ses);
        },
        child: Container(color: renk));
  }
}
