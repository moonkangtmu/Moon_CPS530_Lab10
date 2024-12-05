import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Web Development using Flutter Framework'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> openLink() async {
    final Uri url =
        Uri.parse('https://docs.flutter.dev/get-started/install/macos/web');
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                '''
Flutter is an open-source UI toolkit by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. My previous work used this framework and therefore I have chose this framework to do my final question in lab 10.

In order to use this framework, I must first install flutter on my machine. There are multiple ways to intall Flutter, the latest recommend way is to install using VS Code.

First Install Visual Studio Code and get the "Flutter extension for VS Code". In VS Code opening the command palette creating a new project using `Flutter: New Project` will prompt you to locate the Flutter SDK. If not installed, we can install it by clicking "Download SDK".

After following the guided installation, we can make sure that we have everything by running `flutter doctor -v`.

More detailed guide on how to install flutter can be found here.
''',
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () => openLink(),
                  child: const Text('Open Flutter Website (MacOS)'),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                '''
For the website you are looking, I had to install flutter's library for opening links in a new tab. Which can be installed by running `flutter pub add url_launcher` in the terminal from project directory.

Then after, following the Flutter Front-end syntax, I have added this paragraph and the button that directs to the Flutter install page.

To actually deploy this, I knew that GitHub offers service where I can deploy this Flutter application. To do so, I first created the web build by running `flutter build web` on terminal. Which creates a web version that I can deploy.

Then I made a git repo for this project.
''',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
