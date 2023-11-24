import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Providerdemo extends StatefulWidget {
  const Providerdemo({super.key});

  @override
  State<Providerdemo> createState() => _ProviderdemoState();
}

class _ProviderdemoState extends State<Providerdemo> {
  late final CounterProvider counterProvider;
  @override
  Widget build(BuildContext context) {
    counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Text(value.count.toString());
              },
            ),
            ElevatedButton(
              child: Icon(Icons.add),
              onPressed: counterProvider.update,
            ),
          ],
        ),
      ),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int count = 0;
  update() {
    count++;
    notifyListeners();
  }
}
