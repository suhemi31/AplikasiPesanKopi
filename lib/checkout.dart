import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'produk.dart';
import 'tambahBarang.dart';
import 'profile.dart';
import 'halamanutama.dart';
import 'halamanlogin.dart';
import 'invoice_pdf.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool loading = true;

  // data dari database
  List<Map<String, dynamic>> products = [];

  // cart
  List<Map<String, dynamic>> cart = [];

  // ======================
  // AMBIL DATA DARI API
  // ======================
  Future<void> fetchProducts() async {
    final url =
        Uri.parse('http://192.168.1.9/project_mobile/itembarang.php');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      setState(() {
        products = data.map((e) {
          return {
            'kode': e['kode_barang'],
            'nama': e['nama_barang'],
            'harga': int.parse(e['harga_barang']),
          };
        }).toList();
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  // ======================
  // TAMBAH KE CART
  // ======================
  void addToCart(Map<String, dynamic> product) {
    final index =
        cart.indexWhere((item) => item['kode'] == product['kode']);

    setState(() {
      if (index >= 0) {
        cart[index]['qty']++;
      } else {
        cart.add({
          'kode': product['kode'],
          'nama': product['nama'],
          'harga': product['harga'],
          'qty': 1,
        });
      }
    });
  }

  // ======================
  // TOTAL HARGA
  // ======================
  int get totalHarga {
    int total = 0;
    for (var item in cart) {
      total += (item['harga'] as int) * (item['qty'] as int);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHECKOUT'),
        backgroundColor: Colors.grey,
      ),

      // ======================
      // DRAWER
      // ======================
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              child: Image.asset('images/project2.png'),
            ),
    
            ListTile(
              title: const Text('HALAMAN UTAMA'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DesainHalamanUtama()),
                );
              },
            ),
            ListTile(
              title: const Text('PROFILE'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Profile()),
                );
              },
            ),
            ListTile(
              title: const Text('PRODUK'),
              leading: const Icon(Icons.inventory),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Produk()),
                );
              },
            ),

            ListTile(
              title: const Text('TAMBAH PRODUK'),
              leading: const Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const tambahBarang()),
                );
              },
            ),


            ListTile(
              title: Text('CHECK OUT'),
              leading: Icon(Icons.add_shopping_cart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Checkout()),
                );
              },
            ),

            ListTile(
              title: const Text('LOGOUT'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const DesainHalamanLogin()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      // ======================
      // BODY
      // ======================
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // ===== LIST PRODUK DARI DATABASE =====
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final p = products[index];
                      return Card(
                        child: ListTile(
                          title: Text(p['nama']),
                          subtitle: Text('Rp ${p['harga']}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.add_circle,
                                color: Colors.green),
                            onPressed: () => addToCart(p),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ===== CART & TOTAL =====
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey.shade200,
                  child: Column(
                    children: [
                      Text(
                        'Item di Cart: ${cart.length}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Total: Rp $totalHarga',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      ElevatedButton(
                        onPressed: cart.isEmpty
                        ? null
                         : () {
                          InvoicePdf.generate(
                            cart: cart,
                           totalHarga: totalHarga,
                          );
                            },
                       child: const Text('CHECKOUT'),),

                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
