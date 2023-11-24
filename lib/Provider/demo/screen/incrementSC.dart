import 'package:apidata/Provider/demo/Provider/incPRO.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PluseButtonSC extends StatefulWidget {
  const PluseButtonSC({super.key});

  @override
  State<PluseButtonSC> createState() => _PluseButtonSCState();
}

class _PluseButtonSCState extends State<PluseButtonSC> {
  late IncrementProvider incrementProvider;
  @override
  Widget build(BuildContext context) {
    incrementProvider = Provider.of<IncrementProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pluse Increment"),
      ),
      body: Column(
        children: [
          Consumer<IncrementProvider>(
            builder: (context, value, child) {
              return Text(value.pluseBT.toString());
            },
          ),
          ElevatedButton(
              onPressed: incrementProvider.pluse, child: Icon(Icons.add))
        ],
      ),
    );
  }
}
