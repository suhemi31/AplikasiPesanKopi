import 'package:flutter/material.dart';
import 'package:project_mobile/halamanlogin.dart';
import 'package:project_mobile/logout.dart';
import 'profile.dart';
import 'produk.dart';
import 'tambahBarang.dart';
import 'checkout.dart';

class DesainHalamanUtama extends StatefulWidget {
  const DesainHalamanUtama({super.key});

  @override
  State<DesainHalamanUtama> createState() => _DesainHalamanUtamaState();
}

class _DesainHalamanUtamaState extends State<DesainHalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset('images/project2.png'),
              decoration: BoxDecoration(color: Colors.teal),
            ),

            ListTile(
              title: const Text('HOME'),
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
            const SizedBox(height: 30),

            // LOGO USAHA
            ClipOval(
              child: Image.asset('images/gambar1.png', width: 350, height: 350, fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

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
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ),

            const SizedBox(height: 10),

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

            // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 5),

            // TEKS PETUNJUK
            const Text(
              'HUBUNGI KAMI',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 13,
              ),
            ),

            const Text(
              'Jangan Ragu Hubungi Call Center Kami'
              'Kapanpun Kamu Membutuhkan', textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.call,
                  size: 16,
                  color: Colors.grey,
                ),
              SizedBox(width: 6),
              Text(
                'Call Center : 08111 2455 811',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
            Icon(Icons.email,
                  size: 16,
                  color: Colors.grey,
                ),
              SizedBox(width: 6),
              Text(
                'Email : ahmdsuhemii@gmail.com',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),

            // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 5),

            // TEKS PETUNJUK
            const Text(
              'Silakan Pilih Menu di Aplikasi',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 5),

            // BUTTON KE HALAMAN UTAMA
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
            const SizedBox(width: 5),

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
                          
                          const SizedBox(width: 5),

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

                          const SizedBox(width: 5),

            // BUTTON KE HALAMAN TAMBAH BARANG
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

                      const SizedBox(width: 5),

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

                      const SizedBox(width: 5),
              ]
            ),
          ],
        ),
      ),  

    );
  }
}
