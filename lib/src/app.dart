import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_tutorial/src/basics/01_animated_builder.dart';
import 'package:flutter_tutorial/src/basics/02_page_route_builder.dart';
import 'package:flutter_tutorial/src/basics/03_animation_controller.dart';
import 'package:flutter_tutorial/src/basics/04_tweens.dart';
import 'package:flutter_tutorial/src/basics/05_animated_container.dart';
import 'package:flutter_tutorial/src/basics/06_custom_tween.dart';
import 'package:flutter_tutorial/src/basics/07_tween_sequence.dart';
import 'package:flutter_tutorial/src/basics/08_fade_transition.dart';

import 'package:flutter_tutorial/src/misc/01_hero_animation.dart';


const double windowWidth = 480;
const double windowHeight = 854;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      name: '1. AnimatedBuilder',
      route: AnimatedBuilderDemo.routeName,
      builder: (context) => const AnimatedBuilderDemo()),

  Demo(
      name: '2. PageRouteBuilder',
      route: PageRouteBuilderDemo.routeName,
      builder: (context) => const PageRouteBuilderDemo()),

  Demo(
      name: '3. Animation Controller',
      route: AnimationControllerDemo.routeName,
      builder: (context) => const AnimationControllerDemo()),

  Demo(
      name: '4. Tweens',
      route: TweenDemo.routeName,
      builder: (context) => const TweenDemo()),

  Demo(
      name: '5. AnimatedContainer',
      route: AnimatedContainerDemo.routeName,
      builder: (context) => const AnimatedContainerDemo()),

  Demo(
      name: '6. Custom Tween',
      route: CustomTweenDemo.routeName,
      builder: (context) => const CustomTweenDemo()),

  Demo(
      name: '7. Tween Sequences',
      route: TweenSequenceDemo.routeName,
      builder: (context) => const TweenSequenceDemo()),

  Demo(
      name: '8. Fade Transition',
      route: FadeTransitionDemo.routeName,
      builder: (context) => const FadeTransitionDemo()),

];

final miscDemos = [
  Demo(
      name: '1- Hero Animation',
      route: HeroAnimationDemo.routeName,
      builder: (context) => const HeroAnimationDemo()),
  
  Demo(
      name: '2- Hero Animation',
      route: HeroAnimationDemo.routeName,
      builder: (context) => const HeroAnimationDemo()),

  Demo(
      name: '3- Hero Animation',
      route: HeroAnimationDemo.routeName,
      builder: (context) => const HeroAnimationDemo()),
];

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
