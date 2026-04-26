import 'package:flutter/material.dart';
import '../models/article.dart';
import 'detail_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final List<Article> articles = [
    Article(
      title: "Hutan Tropis Indonesia",
      desc:  "Hutan tropis Indonesia merupakan salah satu yang terbesar di dunia dan memiliki keanekaragaman hayati yang sangat tinggi. Di dalamnya hidup berbagai jenis flora dan fauna endemik yang tidak ditemukan di tempat lain. Hutan ini juga berperan penting dalam menjaga keseimbangan iklim global, menyimpan cadangan air, serta menjadi sumber kehidupan bagi masyarakat sekitar. Oleh karena itu, pelestarian hutan tropis sangat penting untuk masa depan lingkungan.",
    ),
    Article(
      title: "Keindahan Laut Bali",
      desc: "Laut Bali terkenal dengan keindahan bawah lautnya.",
    ),
    Article(
      title: "Gunung dan Ekosistem",
      desc: "Gunung memiliki peran penting dalam ekosistem.",
    ),
    Article(
      title: "Satwa Langka",
      desc: "Indonesia memiliki banyak satwa langka.",
    ),
    Article(
      title: "Perubahan Iklim",
      desc: "Perubahan iklim berdampak pada kehidupan manusia.",
    ),
    Article(
      title: "Konservasi Alam",
      desc: "Menjaga kelestarian alam sangat penting.",
    ),
    Article(
      title: "Ekowisata",
      desc: "Pariwisata ramah lingkungan semakin populer.",
    ),
    Article(
      title: "Flora Endemik",
      desc: "Indonesia memiliki banyak flora unik.",
    ),
    Article(
      title: "Fauna Langka",
      desc: "Perlindungan fauna langka sangat penting.",
    ),
    Article(
      title: "Lingkungan Hidup",
      desc: "Menjaga lingkungan adalah tanggung jawab bersama.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final email =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
          )
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          // 🔥 CARD WELCOME
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column( // 🔥 diubah jadi column biar bisa tambah text
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person,
                            size: 40, color: Colors.green),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Selamat datang, $email",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // 🔥 TAMBAHAN (SESUI PERMINTAAN KAMU)
                    Row(
                      children: [
                        const Icon(Icons.dashboard,
                            color: Colors.green, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          "Selamat Datang Dashboard",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.green[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 🔥 LIST ARTIKEL
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.nature, color: Colors.white),
                    ),
                    title: Text(
                      articles[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(articles[index].desc),
                    trailing:
                        const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            title: articles[index].title,
                            desc: articles[index].desc,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
