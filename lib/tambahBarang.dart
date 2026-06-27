import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_mobile/halamanlogin.dart';
import './produk.dart';
import './profile.dart';
import 'checkout.dart';
import 'halamanutama.dart';

class tambahBarang extends StatefulWidget {
  const tambahBarang({super.key});

  @override
  State<tambahBarang> createState() => _tambahBarangState();
}

class _tambahBarangState extends State<tambahBarang> {
  final formKey = GlobalKey<FormState>();
  String kode_barang = '';
  String nama_barang = '';
  String harga_barang = '';

  // Fungsi POST ke API
  Future<void> postData() async {
    final response = await http.post(
      Uri.parse('http://192.168.1.9/project_mobile/itembarang.php'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {'kode': kode_barang, 'nama': nama_barang, 'harga' : harga_barang},
    );

    if (response.statusCode == 200) {
      print('Upload data sukses');
    } else {
      print('Gagal mengupload');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TAMBAH BARANG',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.grey,
      ),

      // DRAWER
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset('images/project2.png'),
              decoration: const BoxDecoration(color: Colors.teal),
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

      // BODY: Form Tambah Barang
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kode Barang'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kode barang tidak boleh kosong';
                  } else {
                    kode_barang = value;
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Barang'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama barang tidak boleh kosong';
                  } else {
                    nama_barang = value;
                    return null;
                  }
                },
              ),
               TextFormField(
                decoration: const InputDecoration(labelText: 'Harga Barang'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga barang tidak boleh kosong';
                  } else {
                    harga_barang = value;
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
      ),

      // FLOATING BUTTON SIMPAN
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await postData();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    '$kode_barang - $nama_barang - $harga_barang ditambahkan'),
              ),
            );
            Navigator.pop(context);
          }
        },
        child: const Icon(Icons.save),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
