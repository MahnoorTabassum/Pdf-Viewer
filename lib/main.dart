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
      title: 'E-Book Library',
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
      home: BookListSCR(),
    );
  }
}

class BookListSCR extends StatefulWidget {
  const BookListSCR({super.key});

  @override
  State<BookListSCR> createState() => _BookListSCRState();
}

class _BookListSCRState extends State<BookListSCR> {
  List bookList = [
    {"name": "The Game of Life and How to Play It – Florence Scovel Shinn", "location": "assets/the-game-of-life-and-how-to-play-it-florence-scovel-shinn.pdf"},
    {"name": "Crime and Punishment – Fyodor Dostoevsky", "location": "assets/crime-and-punishment.pdf"},
    {"name": "Mind Power: The Secret of Mental Magic – William Walker Atkinson", "location": "assets/mind_power_secret_mental_magic.pdf"},
    {"name": "The Light We Cannot See – Anthony Doerr", "location": "assets/the_light_we_cannot_see.pdf"},
    {"name": "The Master Key – Charles F. Haanel", "location": "assets/master_key_charles_haanel.pdf"},
    {"name": "The Power of Now – Eckhart Tolle", "location": "assets/the_power_of_now.pdf"},
    {"name": "The Pivot Year – Brianna Wiest", "location": "assets/The-Pivot-Year.pdf"},
    {"name": "Set Boundaries, Find Peace – Nedra Glover Tawwab", "location": "assets/Set_Boundaries_Find_Peace_.pdf"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PdfSCR(index)),
              );
            },
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(bookList[index]["name"]),
          );
        },
      ),
    );
  }
}

class PdfSCR extends StatefulWidget {
  var bookNumber;
  PdfSCR(this.bookNumber, {super.key});

  @override
  State<PdfSCR> createState() => _PdfSCRState();
}

class _PdfSCRState extends State<PdfSCR> {
  List bookList = [
    {"name": "The Game of Life and How to Play It – Florence Scovel Shinn", "location": "assets/the-game-of-life-and-how-to-play-it-florence-scovel-shinn.pdf"},
    {"name": "Crime and Punishment – Fyodor Dostoevsky", "location": "assets/crime-and-punishment.pdf"},
    {"name": "Mind Power: The Secret of Mental Magic – William Walker Atkinson", "location": "assets/mind_power_secret_mental_magic.pdf"},
    {"name": "The Light We Cannot See – Anthony Doerr", "location": "assets/the_light_we_cannot_see.pdf"},
    {"name": "The Master Key – Charles F. Haanel", "location": "assets/master_key_charles_haanel.pdf"},
    {"name": "The Power of Now – Eckhart Tolle", "location": "assets/the_power_of_now.pdf"},
    {"name": "The Pivot Year – Brianna Wiest", "location": "assets/The-Pivot-Year.pdf"},
    {"name": "Set Boundaries, Find Peace – Nedra Glover Tawwab", "location": "assets/Set_Boundaries_Find_Peace_.pdf"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.asset(bookList[widget.bookNumber]["location"]),
    );
   

  }
}