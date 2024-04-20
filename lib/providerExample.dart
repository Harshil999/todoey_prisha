import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) {
            return MyData();
          },
        ),
      ], // lazy: false,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: MyText(
                flag: 'title',
              ),
            ),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        MySecondTextField(),
        SizedBox(
          height: 18.0,
        ),
        MyText(
          flag: 'txt',
        ),
      ],
    );
  }
}

class MyData extends ChangeNotifier {
  String firstData = 'My Data Name', secondData = 'My Second Data';

  updateFirstData(String newDataNm) {
    firstData = newDataNm;
    notifyListeners();
  }

  updateSecondData(String newDataNm) {
    secondData = newDataNm;
    notifyListeners();
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.flag,
  });

  final String flag;

  @override
  Widget build(BuildContext context) {
    return Text(
      flag == 'txt'
          ? Provider.of<MyData>(context).firstData
          : Provider.of<MyData>(context).secondData,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newValue) {
        print('new val: $newValue');
        Provider.of<MyData>(context, listen: false).updateFirstData(newValue);
      },
    );
  }
}

class MySecondTextField extends StatelessWidget {
  const MySecondTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newValue) {
        print('second textFieldValue: $newValue');
        Provider.of<MyData>(context, listen: false).updateSecondData(newValue);
      },
    );
  }
}
