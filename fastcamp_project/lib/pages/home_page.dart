import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First Page'),
      ),
      body: const SizedBox(
        width: 200,
        height: 200,
        child: Text(
          'flutter hellosdlakjdlkasjdklasjkdlasjdlkasjldkkjasdsalkasldkjaskldjasljdlksaslkdjaskldjaskljdlksajdlasjldjaslkdalkdjaskldjsalkdjlasjdlalksjdlkasjdklasjdlkasjdlsajdklasjdjasldjlsakjdlkasjdlkajslalkdjlkasjdlkasjdlsakjdlkasjkldasjlkdajsldjalskjdalskjdlkasjdklsajdlasjldkajskldjasalkjdlaskjdlkasjdklasjldkasjldjalsdjlasjdlksalkdjalskjdklasjdlkasaslkdjaslkdjlksaldkjaslkdjsalkdjalskjdlsaaslkdjsalkdjlaksjdlksad',
        ),
      ),
    );
  }
}
