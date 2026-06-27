import 'package:flutter/material.dart';
import './halamanlogin.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(
          'LOGOUT',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.grey,
      ),

      // Semua konten harus di body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [ 

        // LOGO USAHA
            ClipOval(
              child: Image.asset('images/gambar1.png', width: 350, height: 350, fit: BoxFit.cover,
              ),
            ),

        // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

              const SizedBox(height: 25),

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
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ), 

              const SizedBox(height: 25),
            
            // GARIS PEMISAH
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),

             const SizedBox(height: 25),

            // BUTTON KE HALAMAN HALAMAN LOGIN
            ElevatedButton.icon(
              onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => const DesainHalamanLogin()),
                );
                  },
                      icon: const Icon(Icons.logout),
                      label: const Text('LOGOUT'),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        ),
                          ),
                            ),

                      const SizedBox(height: 25),
    
          ],
        ),
      ),
    );
  }
}