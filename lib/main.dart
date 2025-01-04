import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pub.dev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SvgExampleScreen(),
      },
    );
  }
}

class SvgExampleScreen extends StatelessWidget {
  const SvgExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Flutter SVG Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SVG from Assets:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: SvgPicture.asset(
                  'assets/images/android.svg', // Replace with your asset path
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                  placeholderBuilder: (BuildContext context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'SVG from Network:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: SvgPicture.network(
                  'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                  placeholderBuilder: (BuildContext context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Interactive SVG Example:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('SVG clicked!')),
                  );
                },
                child: SvgPicture.asset(
                  'assets/images/android.svg', // Replace with your asset path
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                  color: Colors.blue, // Apply a color tint
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Animated SVG Example:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                height: 200,
                width: 200,
                child: SvgPicture.asset(
                  'assets/images/android.svg', // Replace with your asset path
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
