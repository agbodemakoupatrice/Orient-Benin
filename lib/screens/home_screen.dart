import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// On importe les pages des onglets
// On les créera juste après
import 'orientation/orientation_home.dart';
import 'stages/stages_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // L'onglet actif (0 = Accueil)
  int _currentIndex = 0;

  // Les 4 pages de la navigation
  final List<Widget> _pages = [
    const AccueilPage(), // onglet 0
    const OrientationHome(), // onglet 1
    const StagesList(), // onglet 2
    const ProfilPage(), // onglet 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Affiche la page active
      body: _pages[_currentIndex],

      // Barre de navigation du bas
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.greyColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Orientation',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Stages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// ===== PAGE ACCUEIL =====
class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(title: const Text('OrientBénin')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carte de bienvenue
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.primaryColor, Color(0xFF0D5C38)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bonjour 👋',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Que cherches-tu\naujourd\'hui ?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Titre section
            const Text(
              'Nos services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkColor,
              ),
            ),

            const SizedBox(height: 16),

            // Cartes des services
            Row(
              children: [
                Expanded(
                  child: _ServiceCard(
                    icon: Icons.school,
                    title: 'Orientation',
                    description: 'Trouve ta filière idéale',
                    color: AppTheme.primaryColor,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _ServiceCard(
                    icon: Icons.work,
                    title: 'Stages',
                    description: 'Offres disponibles',
                    color: AppTheme.secondaryColor,
                    onTap: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Titre stats
            const Text(
              'En chiffres',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkColor,
              ),
            ),

            const SizedBox(height: 16),

            // Statistiques
            Row(
              children: [
                Expanded(
                  child: _StatCard(valeur: '8+', label: 'Filières'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(valeur: '20+', label: 'Établissements'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(valeur: '50+', label: 'Stages'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ===== WIDGET CARTE SERVICE =====
class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppTheme.darkColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 12, color: AppTheme.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== WIDGET STAT =====
class _StatCard extends StatelessWidget {
  final String valeur;
  final String label;

  const _StatCard({required this.valeur, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            valeur,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppTheme.greyColor),
          ),
        ],
      ),
    );
  }
}

// ===== PAGE PROFIL (temporaire) =====
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Profil\nen construction',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
