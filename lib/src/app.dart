import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_tutorial/src/basics/01_animated_builder.dart';
import 'package:flutter_tutorial/src/misc/01_hero_animation.dart';


const double windowWidth = 480;
const double windowHeight = 854;


class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({
    required this.name,
    required this.route,
    required this.builder,
  });
}

final basicDemos = [
  Demo(
      name: 'AnimatedBuilder',
      route: AnimatedBuilderDemo.routeName,
      builder: (context) => const AnimatedBuilderDemo()),
];

final miscDemos = [
  Demo(
      name: 'Hero Animation',
      route: HeroAnimationDemo.routeName,
      builder: (context) => const HeroAnimationDemo()),
];

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        for (final demo in basicDemos)
          GoRoute(
            path: demo.route,
            builder: (context, state) => demo.builder(context),
          ),
        for (final demo in miscDemos)
          GoRoute(
            path: demo.route,
            builder: (context, state) => demo.builder(context),
          ),
      ],
    ),
  ],
);

class FlutterTutorialApp extends StatelessWidget {
  const FlutterTutorialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routerConfig: router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Ejemplos'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Básico', style: headerStyle)),
          ...basicDemos.map((d) => DemoTile(demo: d)),
          ListTile(title: Text('Varios', style: headerStyle)),
          ...miscDemos.map((d) => DemoTile(demo: d)),
          ListTile(title: Text('Información', style: headerStyle)),
          // ignore: prefer_const_constructors
          ListTile(title: Text('Descargar código'), onTap: () {}),
          // ignore: prefer_const_constructors
          ListTile(title: Text('Cómo instalar flutter'), onTap: () {}),
          // ignore: prefer_const_constructors
          ListTile(title: Text('Cómo ejecutar la App en PC'), onTap: () {}),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  const DemoTile({required this.demo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        context.go('/${demo.route}');
      },
    );
  }
}
