import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import 'package:ti_calc/widgets/cost_widgets.dart';
import 'package:ti_calc/widgets/fleet_list.dart';
import 'package:ti_calc/widgets/unit_table.dart';
import 'package:ti_calc/unit_data.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Create Fleet', style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: Column(
        children: [
          Container( margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ResourceCard(),
                  ProdCard()
                ]
            ),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: UnitTable(unitData: unitData),
          ),
          const FleetList(),
        ],
      ),
    );
  }
}