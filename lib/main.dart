import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //Step 3
        home: ChangeNotifierProvider(
          create: (context) => Counter(),
          child: MyHomePage(),
        ));
  }
}

//STEP 2
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    final counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management Provider Review"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Counter>(
            //consumer digunakan untuk tampilan yang selalu berubah-ubah
            builder: (context, value, child) {
              return Text(
                value._counter.toString(),
                style: TextStyle(fontSize: 35),
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    counter.minus();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    counter.add();
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}

//STEP 1
class Counter with ChangeNotifier {
  int _counter = 0;

  int get counter {
    return _counter;
  }

  void add() {
    _counter += 1;
    notifyListeners();
  }

  void minus() {
    _counter -= 1;
    notifyListeners();
  }
}
