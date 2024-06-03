import 'package:artracker/Widgets/app_bar.dart';
import 'package:artracker/screens/ar_agent.dart';
import 'package:flutter/material.dart';
import 'package:artracker/providers/theme_provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeMode? themeMode;
  const MyApp({super.key, this.themeMode});


  
   // // Get the brightness of the platform (light or dark)
    // Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    // ThemeMode themeModeLocal = platformBrightness == Brightness.dark
    //     ? context.read<ThemeProvider>().themeMode = ThemeMode.dark
    //     : context.read<ThemeProvider>().themeMode = ThemeMode.light;
    // debugPrint('Theme Mode: $themeModeLocal'); // Print the theme mode to the console

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(

    title: 'Flutter Demo',
    theme: FlexThemeData.light(
      scheme: context.watch<ThemeProvider>().usedScheme,
      useMaterial3: true,
      // Define text styles for light theme
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 24.0),
        bodyMedium: TextStyle(fontSize: 16.0),
        bodySmall: TextStyle(fontSize: 9.0),
        labelLarge: TextStyle(fontSize: 9.0),
        labelMedium: TextStyle(fontSize: 9.0),
        labelSmall: TextStyle(fontSize: 9.0),
        titleLarge: TextStyle(fontSize: 9.0),
        titleMedium: TextStyle(fontSize: 9.0),
        titleSmall: TextStyle(fontSize: 9.0),
      ),
    ),
    darkTheme: FlexThemeData.dark(
      scheme: context.watch<ThemeProvider>().usedScheme,
      useMaterial3: true,
      // Define text styles for dark theme, copying from light theme
      textTheme: FlexThemeData.light(
        scheme: context.watch<ThemeProvider>().usedScheme,
        useMaterial3: true,
      ).textTheme.copyWith(
        bodyLarge: TextStyle(fontSize: 24.0),
        bodyMedium: TextStyle(fontSize: 16.0),
        bodySmall: TextStyle(fontSize: 9.0),
        labelLarge: TextStyle(fontSize: 9.0),
        labelMedium: TextStyle(fontSize: 9.0),
        labelSmall: TextStyle(fontSize: 9.0),
        titleLarge: TextStyle(fontSize: 9.0),
        titleMedium: TextStyle(fontSize: 9.0),
        titleSmall: TextStyle(fontSize: 9.0),
       ),
     ),
      themeMode: context.watch<ThemeProvider>().themeMode,
      debugShowCheckedModeBanner: false,
    //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
     initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        ArAgent.routeName: (context) =>  ArAgent(),
        // PatientSearchDialog.routeName: (context) => const PatientSearchDialog(),
  },);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //  ThemeMode _themeMode = ThemeMode.system;
// bool _initialized = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

@override
  void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    // This code runs after the first frame is displayed
    // Context is fully initialized at this point
    _initializeThemeMode();
  });
}

void _initializeThemeMode() {
  // Get the brightness of the platform (light or dark)
  Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

  // Determine the initial theme mode based on the platform brightness
  ThemeMode initialThemeMode = platformBrightness == Brightness.dark
      ? ThemeMode.dark
      : ThemeMode.light;

  // Update the theme mode using the ThemeProvider
  context.read<ThemeProvider>().themeMode = initialThemeMode;

  debugPrint('Initial Theme Mode: $initialThemeMode');
}
  @override
  Widget build(BuildContext context) {
    // // Get the brightness of the platform (light or dark)
    // Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    // ThemeMode themeModelocal = platformBrightness == Brightness.dark
    //     ?  ThemeMode.dark
    //     :  ThemeMode.light;
    // debugPrint('Theme Mode: $themeModelocal'); // Print the theme mode to the console

    return Scaffold(
      appBar: const AppBarCommon(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                hoverColor: Colors.orange,
                tooltip: "AR Module",
                onPressed: () {
                  // context
                  //     .read<Auth>()
                  //     .setAll(null, null, null, null, null, false, null);
                  Navigator.pushReplacementNamed(context, '/ar-agent');
                },
                icon: const Icon(
                  Icons.logout_rounded,
                ),
              ),
             Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


