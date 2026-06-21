import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/filiere_service.dart'; // Importation de ton service réseau
import 'orientation/orientation_home.dart';
import 'stages/stages_list.dart';
import '../models/filiere_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AccueilPage(), // Onglet 0
    const OrientationHome(), // Onglet 1
    const StagesList(), // Onglet 2
    const Scaffold(
      body: Center(child: Text("Profil (Bientôt disponible)")),
    ), // Onglet 3 temporaire
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
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

// ===== ZONE PRIVÉE : COMPOSANT PAGE ACCUEIL TRANSFORME EN STATEFUL =====
class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  late Future<List<FiliereModel>> _filiereDataFuture;

  @override
  void initState() {
    super.initState();
    // On amorce l'appel vers ton serveur Node.js dès l'ouverture de l'application
    _filiereDataFuture = FiliereService.recupererToutesLesFilieres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LIGNE 1 : CONTÔLES ET DRAPEAU NATIONAL
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('🇧🇯', style: TextStyle(fontSize: 28)),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.notifications_outlined,
                          size: 26,
                          color: AppTheme.darkColor,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppTheme.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // LIGNE 2 : IDENTITÉ VISUELLE
              Center(
                child: Container(
                  width: 182,
                  height: 61,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Bannière d'accueil stylisée
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.primaryColor, Color(0xFF0D5C38)],
                  ),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bonjour 👋',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    SizedBox(height: 5),
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
              const SizedBox(height: 27),

              const Text(
                'Nos services',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkColor,
                ),
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _ServiceCard(
                      icon: Icons.school,
                      title: 'Orientation',
                      description: 'Filière idéale',
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _ServiceCard(
                      icon: Icons.work,
                      title: 'Stages',
                      description: 'Offres',
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 29),

              const Text(
                'Flux d\'actualités du serveur',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkColor,
                ),
              ),
              const SizedBox(height: 15),

              // INTÉGRATION DU FUTUREBUILDER RÉSEAU COMMUNIQUANT AVEC NODE.JS
              FutureBuilder<List<FiliereModel>>(
                future: _filiereDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.cloud_off, color: Colors.red, size: 30),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Impossible de joindre le serveur. Vérifie que Node.js tourne.",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  final filieres = snapshot.data!;

                  if (filieres.isEmpty) {
                    return const Center(
                      child: Text("Aucune filière disponible pour le moment."),
                    );
                  }

                  // SÉLECTION DU COMPOSANT DYNAMIQUE : Affichage sous forme de liste fluide
                  return ListView.builder(
                    shrinkWrap:
                        true, // Indispensable pour fonctionner dans un SingleChildScrollView
                    physics:
                        const NeverScrollableScrollPhysics(), // Laisse le défilement au parent global
                    itemCount: filieres.length,
                    itemBuilder: (context, index) {
                      final filiere = filieres[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.account_balance, // Icône université
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          title: Text(
                            filiere.nomFiliere,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppTheme.darkColor,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                "${filiere.etablissement} (${filiere.universite})",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      "Bourses : ${filiere.quotasBourses}",
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.secondaryColor
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      "Payant : ${filiere.quotasFpp}",
                                      style: const TextStyle(
                                        color: AppTheme.secondaryColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            // Logique future : ouvrir les détails de la filière
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Composant local de carte de service simplifié pour éviter les erreurs de compilation
class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
