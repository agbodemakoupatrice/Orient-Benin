class AppConstants {
  // Nom de l'application
  static const String appName = 'OrientBénin';

  // Messages
  static const String welcomeMessage = 'Bienvenue sur OrientBénin';
  static const String onboardingTitle1 = 'Trouve ta filière idéale';
  static const String onboardingTitle2 = 'Découvre les stages';
  static const String onboardingTitle3 = 'Lance ta carrière';

  static const String onboardingDesc1 =
      'Réponds à quelques questions et découvre les filières qui correspondent à ton profil et tes ambitions.';
  static const String onboardingDesc2 =
      'Accède aux meilleures offres de stage au Bénin et postule directement depuis l\'application.';
  static const String onboardingDesc3 =
      'Connecte-toi avec les entreprises et démarre ta carrière professionnelle au Bénin.';

  // Routes (noms des pages)
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String orientationRoute = '/orientation';
  static const String stagesRoute = '/stages';

  //======CONFIGURATION API ET RESEau======
  //Pour mon telephone

  static const String _localUrl = "http://10.255.57.70:5000";
  //IP passerelle magique officielle de google pour l'emulateur android virtuel

  static const String _emulatorUrl = "http://10.0.2.2:5000";
  // Adresse pour d'autre utilisateur sur Railway

  static const String _productionUrl = "https://railway.app";

  // Interrupteur (true= mon pc actuel, false= le cloud plus tard)

  static const bool isDevelopment = true;

  // Interrupteur emulateur (true= emullateur, false= mon telepnone)

  static const bool useEmulator = false;

  // l'url utilisée par toute l'application

  static String get baseUrl {
    if (!isDevelopment) return _productionUrl;
    return useEmulator ? _emulatorUrl : _localUrl;
  }

  //Points d'acces externes de l'api node.js

  static String get apiFilieresRoute => "$baseUrl/api/filieres";
  static String get apiRegisterRoute => "$baseUrl/api/auth/register";
  static String get apiLoginRoute => "$baseUrl/api/auth/login";
}
