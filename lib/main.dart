import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj1/features/representations/widgets/all_tasks.dart';
import 'package:proj1/features/representations/widgets/completed_tasks.dart';
import 'package:proj1/features/representations/widgets/favorite_tasks.dart';
import 'package:proj1/features/representations/pages/schedule_tasks.dart';
import 'package:proj1/features/representations/pages/add_task_page.dart';
import 'package:proj1/core/util/cubit/states.dart';
import 'package:proj1/features/representations/widgets/uncompleted_tasks.dart';
import 'core/util/cubit/app_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc()..initDatabase(),
        ),
      ],
      child: BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            routes: {
              '/a': (ctx) => const AddTaskPage(),
              '/b': (ctx) => const MyApp(),
              '/c': (ctx) => ScheduleTasks(),
              '/d': (ctx) => AddTaskPage(),
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shape: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 2,
            ),
          ),

          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            "Board",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              const Tab(
                text: "All",
              ),
              Tab(text: "Completed"),
              Tab(text: "Uncompleted"),
              Tab(text: "Favorite"),
            ],
          ),
          backgroundColor: Colors.white,

          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/d');
                },
                icon: Icon(Icons.add_circle)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_outlined)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/c');
                },
                icon: Icon(Icons.menu)),
          ],

          // toolbarHeight: 40.0,
        ),
        body: TabBarView(
          children: [
            AllTasks(),
            CompletedTasks(),
            UnCompletedTasks(),
            FavoriteTasks(),
          ],
        ),
      ),
    );
  }
}
