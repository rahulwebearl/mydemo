import 'package:flutter/material.dart';

class SelectMultipleOptions extends StatefulWidget {
  @override
  _SelectMultipleOptionsState createState() => _SelectMultipleOptionsState();
}

class _SelectMultipleOptionsState extends State<SelectMultipleOptions> {
  // create list for store variable
  List selectedOptions = [];

  // create function for store data in list
  void toggleSelection(options) {
    setState(() {
      if (selectedOptions.contains(options)) {
        selectedOptions.remove(options);
      } else {
        selectedOptions.add(options);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Multiple Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: const Text('Option 1'),
              value: selectedOptions.contains('Option 1'),
              onChanged: (value) {
                toggleSelection('Option 1');
              },
            ),
            CheckboxListTile(
              title: const Text('Option 2'),
              value: selectedOptions.contains('Option 2'),
              onChanged: (value) {
                toggleSelection('Option 2');
              },
            ),
            CheckboxListTile(
              title: const Text('Option 3'),
              value: selectedOptions.contains('Option 3'),
              onChanged: (value) {
                toggleSelection('Option 3');
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Selected options: ${selectedOptions.join(", ")}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}


//
//  ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [Text(data[index]["user_name"])],
//               );
//             },
//           )

          //


      //     Column(
      //   children: [
      //     TextField(
      //       controller: emailss,
      //     ),
      //     // DropdownButton<String>(
      //     //   value: email,
      //     //   items: emails.map((email) {
      //     //     return DropdownMenuItem(value: email, child: Text(email));
      //     //   }).toList(),
      //     //   onChanged: (value) {
      //     //     setState(() {
      //     //       email = value!;
      //     //     });
      //     //   },
      //     // ),
      //     SizedBox(),
      //     DropdownButton<String>(
      //       value: password,
      //       items: passwords.map((password) {
      //         return DropdownMenuItem(value: password, child: Text(password));
      //       }).toList(),
      //       onChanged: (value) {
      //         setState(() {
      //           password = value!;
      //         });
      //       },
      //     ),
      //     SizedBox(),
      //     ElevatedButton(
      //         onPressed: () {
      //           registerdata();
      //         },
      //         child: Text("Submit")),
      //   ],
      // ),

      // DropdownButton<String>(
                    //   value: email,
                    //   items: emails.map((email) {
                    //     return DropdownMenuItem(value: email, child: Text(email));
                    //   }).toList(),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       email = value!;
                    //     });
                    //   },
                    // ),