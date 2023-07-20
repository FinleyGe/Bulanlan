import 'package:bulanlan_flutter/state.dart';
import 'package:bulanlan_flutter/widgets/recommend_view.dart';
import 'package:bulanlan_flutter/widgets/tag_cloud_select.dart';
import 'package:bulanlan_flutter/widgets/test_view.dart';
import 'package:bulanlan_flutter/widgets/me_view.dart';
import 'package:flutter/material.dart';
import 'package:bulanlan_flutter/widgets/navigator.dart';
import 'package:provider/provider.dart';
import 'api/api.dart';
import 'widgets/login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewChangeNotifier()),
        ChangeNotifierProvider(create: (_) => UserChangeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bulanlan",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {
        '/test': (context) => const TestView(),
        '/tags': (context) => const TagCloudSelect(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(context.watch<ViewChangeNotifier>().title),
        ),
        body: IndexedStack(
          index: context.watch<ViewChangeNotifier>().nowIndex,
          children: const [
            RecommentView(),
            MeView(),
          ],
        ),
        bottomNavigationBar: const MyNavigator());
  }
}
