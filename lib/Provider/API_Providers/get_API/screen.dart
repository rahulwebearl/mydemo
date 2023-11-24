import 'package:apidata/Provider/API_Providers/get_API/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentSC extends StatefulWidget {
  const StudentSC({super.key});

  @override
  State<StudentSC> createState() => _StudentSCState();
}

class _StudentSCState extends State<StudentSC> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderOperation>(context, listen: false).getAlldata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StudentSC"),
      ),
      body: Consumer<ProviderOperation>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const CircularProgressIndicator();
          }
          final datas = value.welcome;
          return ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, index) {
              final data = datas[index];
              return ListTile(
                title: Text(data.name.toString()),
                leading: Text(data.id.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
