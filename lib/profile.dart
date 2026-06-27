import 'package:flutter/material.dart';
import 'package:project_mobile/halamanlogin.dart';
import 'package:project_mobile/logout.dart';
import 'produk.dart';
import 'checkout.dart';
import 'tambahBarang.dart';
import './halamanutama.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.grey,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset('images/project2.png'),
              decoration: BoxDecoration(color: Colors.teal),
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
              title: const Text('+ BARANG'),
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
      // ================= BODY =================
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),

            // LOGO USAHA
            ClipOval(
              child: Image.asset('images/gambar1.png', width: 300, height: 300, fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),

            // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 8),

            // JUDUL USAHA
            const Text(
              'THE HMZYC - COFFE',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),

            ),
            const Text(
              '"Nikmati Kopimu Dengan Rasa Yang Ada"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // DESKRIPSI USAHA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Kami menyediakan berbagai produk berkualitas '
                'dengan harga terjangkau serta pelayanan terbaik '
                'untuk kepuasan pelanggan.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 8),

             // DESKRIPSI USAHA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'The HMZYC – Coffe didirikan dengan tujuan menghadirkan pengalaman menikmati kopi'
                'yang berkualitas dengan cita rasa yang khas dan autentik. Berawal dari kecintaan terhadap'
                'kopi lokal dan budaya ngopi, The HMZYC – Coffe berkomitmen untuk menyajikan racikan'
                'kopi terbaik yang diolah dari biji kopi pilihan. Seiring berjalannya waktu, coffee shop ini'
                'berkembang menjadi tempat yang nyaman untuk bersantai, berdiskusi, maupun bekerja,'
                'dengan mengedepankan kualitas produk, pelayanan yang ramah, serta suasana yang'
                'hangat. Melalui filosofi “Nikmati Kopimu Dengan Rasa Yang Ada”, The HMZYC – Coffe'
                'terus berinovasi untuk memenuhi kepuasan pelanggan dan menjadi bagian dari gaya'
                'hidup pecinta kopi.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ),

            // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 8),

            const Text(
              '"SUDAHI GALAUMU MARI NGOPI BERSAMA-KU"',  
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
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

             // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 8),

            // BUTTON KE HALAMAN UTAMA
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
            const SizedBox(width: 8),
            
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
                          
                          const SizedBox(width: 8),

            // BUTTON HALAMAN KE PRODUK
            ElevatedButton.icon(
              onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Produk()),
                );
                  },
                      icon: const Icon(Icons.inventory),
                      label: const Text('PRODUK'),
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

                          const SizedBox(width: 8),

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

                      const SizedBox(width: 8),
            
            // BUTTON KE HALAMAN LOGOUT
            ElevatedButton.icon(
              onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Logout()),
                );
                  },
                      icon: const Icon(Icons.logout),
                      label: const Text('LOGOUT'),
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

                      const SizedBox(width: 8),
            
             // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 5),

            // TEKS PETUNJUK
            const Text(
              'Selmat Menikmati Secangkir Coffe di The Hmzyc-Coffe',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                ),
              ),
             ],
            )
          ]
        ),
      ),
    );
  }
}