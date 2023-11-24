import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providerfile.dart';

class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen is initialized
    Provider.of<DataProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get API using Provider'),
      ),
      body: Consumer<DataProvider>(
        builder: (context, dataProvider, _) {
          if (dataProvider.data.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: dataProvider.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dataProvider.data[index]['name']),
                  trailing: Text(dataProvider.data[index]['id'].toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// step 1 create init state add provider.of<UsedProvider Name>(context, listen:false).Api function
// step 2 use Consumer<Used ProviderName> ListviewBuilder .