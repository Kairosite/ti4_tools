import 'package:ti_calc/unit_model.dart';

List<Unit> unitData = [
  Unit(
    title: 'Dreadnought',
    resource: 4,
    production: 1,
    combat: 5,
    move: 1,
    capacity: 1,
    amountMax: 5,
    imagePath: 'assets/images/tile_dread.png',
  ),
  Unit(
    title: 'Carrier',
    resource: 3,
    production: 1,
    combat: 9,
    move: 1,
    capacity: 4,
    amountMax: 4,
    imagePath: 'assets/images/tile_carrier.png',
  ),
  Unit(
    title: 'Cruiser',
    resource: 2,
    production: 1,
    combat: 7,
    move: 2,
    capacity: 0,
    amountMax: 8,
    imagePath: 'assets/images/tile_cruiser.png',
  ),
  Unit(
    title: 'Destroyer',
    resource: 1,
    production: 1,
    combat: 9,
    move: 2,
    capacity: 0,
    amountMax: 8,
    imagePath: 'assets/images/tile_destroy.png',
  ),
  Unit(
    title: 'War Sun',
    resource: 12,
    production: 1,
    combat: 3,
    move: 2,
    capacity: 6,
    amountMax: 2,
    imagePath: 'assets/images/tile_warsun.png',
  ),
  Unit(
    //TODO: Flagships are specific to faction
    title: 'Flagship',
    resource: 8,
    production: 1,
    combat: 0,
    move: 0,
    capacity: 0,
    amountMax: 1,
    imagePath: 'assets/images/tile_flag.png',
  ),
  Unit(
    title: 'Fighter',
    resource: 1,
    production: 2,
    combat: 9,
    move: 0,
    capacity: 0,
    amountMax: 10,
    imagePath: 'assets/images/tile_fighter.png',
  ),
  Unit(
    title: 'Infantry',
    resource: 1,
    production: 2,
    combat: 8,
    move: 0,
    capacity: 0,
    amountMax: 10,
    imagePath: 'assets/images/tile_infantry.png',
  ),
];