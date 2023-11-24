import 'package:apidata/Provider/API_Providers/get_API/provider.dart';
import 'package:apidata/Provider/API_Providers/get_withoutmodel/providerfile.dart';
import 'package:apidata/Provider/API_Providers/post_withoutmodel/copy/provider.dart';
import 'package:apidata/Provider/API_Providers/post_withoutmodel/providerfile.dart';
import 'package:apidata/Provider/demo/task/SliderCountdown.dart';
import 'package:apidata/Provider/demo/task/random_color.dart';
import 'package:apidata/Provider/new.dart';
import 'package:apidata/ValuePass/checkbox/checkbox.dart';
import 'package:apidata/ValuePass/checkbox/checkbox2.dart';
import 'package:apidata/ValuePass/radio/radiobutton.dart';
import 'package:apidata/ValuePass/radio/radiobutton2.dart';
import 'package:apidata/location.dart';
import 'package:apidata/modelApi/products/screen.dart';
import 'package:apidata/modelApi/screen.dart';
import 'package:apidata/modelApi/second/screen.dart';
import 'package:apidata/multiuser.dart';
import 'package:apidata/ValuePass/demo.dart';
import 'package:apidata/postAPi/Postapi/new.dart';
import 'package:apidata/postAPi/Postapi/registration.dart';
import 'package:apidata/postAPi/screen.dart';
import 'package:apidata/store.dart';
import 'package:apidata/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/API_Providers/Post_API/provider.dart';
import 'Provider/API_Providers/Post_API/screen.dart';
import 'Provider/API_Providers/get_API/model.dart';
import 'Provider/API_Providers/get_API/screen.dart';
import 'Provider/API_Providers/get_withoutmodel/screenfile.dart';
import 'Provider/API_Providers/post_with_model/provider.dart';
import 'Provider/API_Providers/post_with_model/screen.dart';
import 'Provider/API_Providers/post_with_model/services.dart';
import 'Provider/API_Providers/post_withoutmodel/copy/screen.dart';
import 'Provider/API_Providers/post_withoutmodel/screen.dart';
import 'Provider/demo/Provider/incPRO.dart';
import 'Provider/demo/favorite.dart';
import 'Provider/demo/screen/favSC.dart';
import 'Provider/demo/screen/fav_selct_screen.dart';
import 'Provider/demo/screen/incrementSC.dart';
import 'Provider/demo/task/From_to_from.dart';
import 'Provider/demo/task/random_capcha.dart';
import 'Provider/demo/task/setAlaram.dart';
import 'Provider/demo/task/date_without_pacakge.dart';
import 'Provider/demo/task/duration_picker.dart';
import 'Provider/demo/task/time_interval_picker.dart';
import 'Provider/demo/task/time_range_picker.dart';
import 'Provider/demo/task/time_without.package.dart';
import 'Provider/provider.dart';
import 'ValuePass/checkbox/checkbox3.dart';
import 'shared preference/allprefrense.dart';
import 'shared preference/simple_exmple.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => favouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => IncrementProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderOperation(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => mypostPROVIDER(),
        ),
        ChangeNotifierProvider(
          create: (context) => Myproviderdemo(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostProviderModel(),
        )
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Form_to_form());
      }),
    );

    // ChangeNotifierProvider(
    //     create: (_) => favouriteProvider(),
    // child: MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const Fav_Sel(),
    // ));
  }
}
