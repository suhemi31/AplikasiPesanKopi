import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoicePdf {
  static Future<void> generate({
    required List<Map<String, dynamic>> cart,
    required int totalHarga,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'INVOICE PENJUALAN',
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),

              pw.Table.fromTextArray(
                headers: ['Produk', 'Harga', 'Qty', 'Subtotal'],
                data: cart.map((item) {
                  return [
                    item['nama'],
                    'Rp ${item['harga']}',
                    item['qty'].toString(),
                    'Rp ${item['harga'] * item['qty']}',
                  ];
                }).toList(),
              ),

              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  'TOTAL: Rp $totalHarga',
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
    
    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),

    );
  }
}
