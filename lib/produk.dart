import 'package:flutter/material.dart';
import 'package:project_mobile/halamanlogin.dart';
import 'profile.dart';
import 'tambahBarang.dart';
import 'halamanutama.dart';
import 'checkout.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Produk extends StatefulWidget {
  const Produk({super.key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  List data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.9/project_mobile/itembarang.php'),
    );

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      // Bisa kasih alert atau print error jika gagal
      print('Gagal mengambil data dari API');
    }
  }

  Future<void> navigateTotambahBarang() async {
    final result = await Navigator.push(
      context, MaterialPageRoute(builder: (_) => const tambahBarang()),
    );
    if (result==true){
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRODUK',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.grey,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              child: Image.asset(
                'images/project2.png',
                fit: BoxFit.cover,
              ),
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

      // BODY: List Produk dari API
      body: Column(
        children: [
          Expanded(child:  data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(Icons.local_cafe),
                    title: Text(data[index]['nama_barang']),
                    subtitle: Text(data[index]['kode_barang']),
                    trailing: Text(
                      data[index]['harga_barang'],
                    ),
                  ),
                );
              },
            ),
          ), 

            const SizedBox(height: 8),

            // TEKS PETUNJUK
            const Text(
              'Silakan Pilih Menu di Aplikasi',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            const Divider(thickness: 1, indent: 40, endIndent: 13,),

            const SizedBox(height: 8),

            // BUTTON KE HALAMAN UTAMA

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
            const SizedBox(width: 6),

            ElevatedButton.icon(
              onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => const DesainHalamanUtama()),
                );
                  },
                      icon: const Icon(Icons.home),
                      label: const Text('HOME'),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        ),
                          ),
                            ),
                          
                          const SizedBox(width: 6),

            // BUTTON HALAMAN KE PROFILE
            ElevatedButton.icon(
              onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Profile()),
                );
                  },
                      icon: const Icon(Icons.person),
                      label: const Text('PROFILE'),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        ),
                          ),
                            ),

                          const SizedBox(width: 6),

            // BUTTON KE HALAMAN CHECK OUT
            ElevatedButton.icon(
              onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => const tambahBarang()),
                );
                  },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('+BARANG'),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        ),
                          ),
                            ),

                      const SizedBox(width: 6),
            
            // BUTTON KE HALAMAN CHECOUT
            ElevatedButton.icon(
              onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Checkout()),
                );
                  },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('CHECKOUT'),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        ),
                          ),
                            ),

                      const SizedBox(width: 6),
            
             // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 5),

            // TEKS PETUNJUK
            const Text(
              'Selamat Menikmati Secangkir Coffe di The Hmzyc-Coffe',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            ]
          ),
        ],    
      ),
    );
  }
}
