import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Reader',
      theme: ThemeData(
        primaryColor: const Color(0xFF556B2F),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF556B2F),
          foregroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF556B2F)),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BookScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffa8caba), Color(0xff5d4157)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            "BOOKS",
            style: GoogleFonts.poppins(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<dynamic>> books = [     
      ['Think and Grow Rich – Napoleon Hill', const Book1Screen()],
      ['The Game of Life and How to Play It – Florence Scovel Shinn', const Book2Screen()],
      ['Crime and Punishment – Fyodor Dostoevsky', const Book3Screen()],
      ['Mind Power: The Secret of Mental Magic – William Walker Atkinson', const Book4Screen()],
      ['The Light We Cannot See – Anthony Doerr', const Book5Screen()],
      ['The Master Key – Charles F. Haanel', const Book6Screen()],
      ['The Power of Now – Eckhart Tolle', const Book7Screen()],
      ['The Pivot Year – Brianna Wiest', const Book8Screen()],
      ['The Pivot Year', const Book9Screen()],
      ['Set Boundaries, Find Peace – Nedra Glover Tawwab', const Book10Screen()],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("E-Books Library")),
      body: ListView.separated(
        itemCount: books.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF556B2F),
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              books[index][0],
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => books[index][1] as Widget),
              );
            },
          );
        },
      ),
    );
  }
}

// Reusable PDF Viewer Screen
class PdfViewerScreen extends StatelessWidget {
  final String assetPath;

  const PdfViewerScreen({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Book"),
      ),
      body: SfPdfViewer.asset(assetPath),
    );
  }
}

// Individual Book Screens
class Book1Screen extends StatelessWidget {
  const Book1Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/think-and-grow-rich-napoleon-hill.pdf');
  }
}

class Book2Screen extends StatelessWidget {
  const Book2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/the-game-of-life-and-how-to-play-it-florence-scovel-shinn.pdf');
  }
}

class Book3Screen extends StatelessWidget {
  const Book3Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/crime-and-punishment.pdf');
  }
}

class Book4Screen extends StatelessWidget {
  const Book4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/The Power Of Now - Eckhart Tolle.pdf');
  }
}

class Book5Screen extends StatelessWidget {
  const Book5Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/the Light We Cannot See.pdf');
  }
}

class Book6Screen extends StatelessWidget {
  const Book6Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/6. The Master Key Author Charles F. Haanel.pdf');
  }
}

class Book7Screen extends StatelessWidget {
  const Book7Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/The Power Of Now - Eckhart Tolle.pdf');
  }
}

class Book8Screen extends StatelessWidget {
  const Book8Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/The-Pivot-Year.pdf');
  }
}

class Book9Screen extends StatelessWidget {
  const Book9Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/The-Pivot-Year.pdf');
  }
}

class Book10Screen extends StatelessWidget {
  const Book10Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return const PdfViewerScreen(assetPath: 'assets/Set_Boundaries_Find_Peace_.pdf');
  }
}
