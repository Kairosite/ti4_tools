class Unit {
  Unit({
    required this.title,
    required this.resource,
    required this.production,
    required this.combat,
    required this.move,
    required this.capacity,
    required this.amountMax,
    required this.imagePath,
    this.ability = '',
  });

  final String title;
  final int resource;
  final int production;
  final int combat;
  final int move;
  final int capacity;
  final int amountMax;
  final String imagePath;
  final String ability;
}

