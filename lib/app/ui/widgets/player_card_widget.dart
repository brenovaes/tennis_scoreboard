import 'package:flutter/material.dart';

class PlayerCardWidget extends StatelessWidget {
  final String playerName;
  final String? urlImage;

  const PlayerCardWidget({
    Key? key,
    required this.playerName,
    this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _splittedName = playerName.split(' ');
    final String _firstName =
        playerName.contains(' ') ? _splittedName[0] : playerName;
    final String _secondName =
        playerName.contains(' ') ? _splittedName.last : '';

    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            urlImage ?? 'assets/images/player-placeholder.png',
          ),
          radius: 30,
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _firstName,
            ),
            Text(
              _secondName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
