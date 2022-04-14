import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/results_controller.dart';

class ResultsView extends GetView<ResultsController> {
  const ResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partidas passadas'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) => controller
                  .isExpanded
                  .value = controller.isExpanded.value == index ? null : index,
              children: controller.matchesList
                  .mapIndexed<ExpansionPanel>((index, item) {
                return ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: controller.isExpanded.value == index,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                item.teams[0].length == 1
                                    ? item.teams[0].first
                                    : '${item.teams[0].first} & ${item.teams[0].last}',
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '${item.result.first.toString()} : ${item.result.last.toString()}',
                              ),
                            ),
                            Flexible(
                              child: Text(
                                item.teams[1].length == 1
                                    ? item.teams[1].first
                                    : '${item.teams[1].first} & ${item.teams[1].last}',
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Data da partida: ${DateFormat('dd/MM/yyyy, HH:mm').format(item.date)}',
                        ),
                        Text(
                          'Duração: ${item.matchDuration}',
                        ),
                        Text('Sets: ${_buildSetsList(item.sets)}'),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  _buildSetsList(List<Map<String, dynamic>> listSets) {
    print(listSets);
    var _list = <String>[];
    listSets.forEachIndexed((index, element) {
      _list.add(
        '${element['firstTeamGames']}:${element['secondTeamGames']}',
      );
    });
    return _list.join(", ");
  }
}
