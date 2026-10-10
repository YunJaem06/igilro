enum AppRoutes {
  home(name: 'home', path: '/');

  const AppRoutes({required this.name, required this.path});

  final String name;
  final String path;
}
