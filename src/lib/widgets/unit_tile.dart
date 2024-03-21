import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import 'package:ti_calc/fleet_provider.dart';
import 'package:ti_calc/unit_model.dart';

double costBoxSize = 30;
int costBoxFlex = 1;
int mainBoxFlex = 5;
int amount = 1;

class UnitTile extends StatelessWidget {
  const UnitTile({super.key,
    required this.unit,
    //required this.image
  });

  final Unit unit;
  //final Widget image;

  @override
  Widget build(BuildContext context) {
     return Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Expanded(
           flex: mainBoxFlex,
           child: Stack(
             children: <Widget>[
               Container(alignment: Alignment.center,
                   child: ImagePlaceholder(imagePath: unit.imagePath)),
               Container(alignment: Alignment.topCenter,
                 child: UnitHeader(title: unit.title),),
               Container(alignment: Alignment.bottomLeft,
                 child: ResourceIcon(resource: unit.resource,),),
               Container(alignment: Alignment.bottomRight,
                 child: ProdIcon(production: unit.production,),),
               TileButtons(unit: unit),
             ],
           ),
         ),
         Expanded(
           flex: costBoxFlex,
           child: AmountTracker(unit: unit,),
         ),
       ],
     );
  }
}

class AmountTracker extends ConsumerWidget {
  const AmountTracker({super.key, required this.unit});
  final Unit unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Unit> fleet = ref.watch(fleetProvider);
    int amount = ref.read(fleetProvider.notifier).getUnitAmount(unit);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      verticalDirection: VerticalDirection.up,
      children: List.generate(unit.amountMax, (index) {
        if (index < amount) {
          return UnitAmount(color: Colors.purpleAccent,);
        }
        return UnitAmount(color: Colors.indigo[800]!,);
      }),
    );
  }
}

class IncrementBtn extends ConsumerWidget {
  const IncrementBtn({super.key, required this.unit,});
  final Unit unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        developer.log('IncrementBtn: onTap ${unit.title}', name: 'MSDevLog');
        ref.read(fleetProvider.notifier).addUnit(unit);
      },
      child: const Icon(Icons.add, color: Colors.white,)
    );
  }
}

class DecrementBtn extends ConsumerWidget {
  const DecrementBtn({super.key, required this.unit,});
  final Unit unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {
          developer.log('DecrementBtn: onTap ${unit.title}', name: 'MSDevLog');
          ref.read(fleetProvider.notifier).removeUnit(unit.title);
        },
        child: const Icon(Icons.remove, color: Colors.white)
    );
  }
}

class TileButtons extends StatelessWidget {
  const TileButtons({super.key, required this.unit});
  final Unit unit;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: DecrementBtn(unit: unit,)
        ),
        Expanded(
          flex: 1,
          child: IncrementBtn(unit: unit),
        ),
      ],
    );
  }
}

class UnitAmount extends StatelessWidget {
  const UnitAmount({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(),
            color: color),
      ),
    );
  }

}

class UnitHeader extends StatelessWidget {
  const UnitHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: Text(title.toUpperCase(),
        style: const TextStyle(
          fontFamily: 'Slider',
          color: Colors.white,
        ),
      ),
    );
  }
}

class ResourceIcon extends StatelessWidget {
  const ResourceIcon({super.key, required this.resource});
  final int resource;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(), right: BorderSide()),
        color: Colors.amberAccent,
      ),
      //color: Colors.amberAccent,
      width: costBoxSize,
      height: costBoxSize,
      alignment: Alignment.center,
      child: Text('$resource'),
    );
  }
}

class ProdIcon extends StatelessWidget {
  const ProdIcon({super.key, required this.production});
  final int production;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(), left: BorderSide()),
        color: Colors.lightBlueAccent,
      ),
      width: costBoxSize,
      height: costBoxSize,
      alignment: Alignment.center,
      child: Text('$production'),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: AssetImage(imagePath),
    );
  }
}