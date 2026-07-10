import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/main_page.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhucBH\'s Portfolio',
      debugShowCheckedModeBanner: false,
      locale: const Locale('vi', 'VN'),
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      home: const MainPage(),
    );
  }
}
