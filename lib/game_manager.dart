import 'package:flutter/material.dart';
import 'package:mafia/role.dart';
import 'package:mafia/user.dart';

class GameManager extends ChangeNotifier {
  GameManager._privateConstructor();

  static final GameManager instance = GameManager._privateConstructor();

  List<User> players = [];

  void addPlayer(User user) {
    players.add(user);
    notifyListeners();
  }

  void reset() {
    for (var i = 0; i < players.length; i++) {
      final player = players[i];
      player.role = Role.none;
    }

    players.shuffle();

    int mafia = players.length ~/ 3 - 1;

    players[0].role = Role.boss;

    if (players.length > 7) {
      players[1].role = Role.doctor;
      players[2].role = Role.sheriff;
    }

    if (players.length > 9) {
      players[3].role = Role.lady;
      players[4].role = Role.killer;
    }

    for (final player in players.where((p) => p.role == Role.none)) {
      if (mafia > 0) {
        player.role = Role.mafia;
        mafia--;
      } else {
        player.role = Role.citizen;
      }
    }
  }
}

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Username", // Replace with the actual username
              style: TextStyle(fontSize: 24), // Adjust the font size as needed
            ),
            SizedBox(height: 20), // Add some space between the name and the button
            ElevatedButton(
              onPressed: () {
                // Add your logic for starting the game
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Increase the padding
                child: Text("Start Game"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
