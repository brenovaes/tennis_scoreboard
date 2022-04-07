import 'package:flutter/material.dart';
import 'package:tennis_scoreboard/app/ui/widgets/player_card_widget.dart';

class PlayersDisplayWidget extends StatelessWidget {
  final List<String> players;
  const PlayersDisplayWidget({
    Key? key,
    required this.players,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _firstPlayer = PlayerCardWidget(
      playerName: players.first,
    );

    Widget _secondPlayer = players.length > 1
        ? PlayerCardWidget(
            playerName: players.last,
          )
        : const SizedBox.shrink();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _firstPlayer,
        players.length > 1
            ? const SizedBox(
                height: 24,
              )
            : const SizedBox.shrink(),
        _secondPlayer,
      ],
    );
  }
}
