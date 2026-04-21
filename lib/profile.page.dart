import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  static String path = "/profile";
  final String nombre;
  final String cargo;
  final String correo;
  final int edad;

  const UserProfilePage({
    super.key,
    required this.nombre,
    required this.cargo,
    required this.correo,
    required this.edad,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 6,
        shadowColor: Colors.black.withValues(alpha: 0.14),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.indigo),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Perfil de usuario',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 16,
            children: [
              //ProfilePic(size: 150),
              ProfilePic(
                size: 150,
                //imageUrl:
                //  'https://img.redbull.com/images/c_fill,g_auto,w_308,h_308/q_auto:low,f_auto/redbullcom/2026/1/14/kxube9xwn3u5bfcxllfa/max-verstappen-2026-oracle-red-bull-racing',
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    cargo,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.14),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    _buildInfoRow(Icons.mail, correo),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _buildInfoRow(Icons.cake, "$edad años"),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _buildInfoRow(Icons.person, cargo),
                    SizedBox(height: 44),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo[300],
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Editar perfil",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label) {
    return Row(
      children: [
        Expanded(flex: 1, child: Icon(icon, color: Colors.indigo[300])),
        Expanded(flex: 4, child: Text(label, textAlign: TextAlign.left)),
      ],
    );
  }
}

class ProfilePic extends StatelessWidget {
  final String? imageUrl;
  final double size;
  const ProfilePic({super.key, this.imageUrl, required this.size});

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      var img = imageUrl ?? "";
      return ClipOval(
        child: Image.network(img, width: size, height: size, fit: BoxFit.cover),
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.indigo[300],
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.person, color: Colors.white, size: size * 0.6),
    );
  }
}
