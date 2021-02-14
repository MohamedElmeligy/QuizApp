import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class MaterialScreen extends StatelessWidget {
  final PDFDocument material;
  MaterialScreen(this.material);
  @override
  Widget build(BuildContext context) {
    return PDFViewer(document: material);
  }
}
