import 'package:flutter/material.dart';
import 'package:gridview/RoundedButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(text: 'Fixed Number', press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FixedNumber()));}, color: Colors.black54, textColor: Colors.white, length: 0.85),
            RoundedButton(text: 'Long List', press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LongList()));}, color: Colors.black54, textColor: Colors.white, length: 0.85),
            RoundedButton(text: 'Responsove GridView', press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ResponsiveGrid()));}, color: Colors.black54, textColor: Colors.white, length: 0.85),
          ].map((e) => Padding(padding: EdgeInsets.all(10.0), child: e,)).toList(),
        ),
      ),
    );
  }
}

class FixedNumber extends StatelessWidget {
  const FixedNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index){
          return Container(
            height: 50,
            color: Colors.red.withOpacity(index/10),
            child: Text('${index}', style: TextStyle(decoration: TextDecoration.none, color: Colors.white),textAlign: TextAlign.center,),
          );
        });;
  }
}

class LongList extends StatelessWidget {
  const LongList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          color: (index%2 == 0)? Colors.red : Colors.blue,
          child: Text(
            '${index}',
            style:
            TextStyle(decoration: TextDecoration.none, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      },
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    );
  }
}


class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        itemCount: 100,
        itemBuilder: (context, index) =>
            Container(color: (index%2==0)?Colors.green : Colors.yellow),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: constraints.maxWidth > 700 ? 4 : 3,
          childAspectRatio: 1,
        ),
      );
    });
  }
}
