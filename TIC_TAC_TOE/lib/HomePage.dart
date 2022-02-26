 import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//TODO: declare var & images

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");
  bool iscross = true;
  String message;

  List<String> gameState;
  String brand = 'Try your luck baby';
//TODO: init state of array with boxes

  @override
  void initState() {
    // TODO: implement initState
    this.gameState = [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];
    this.message = '';
  }

//TODO: game reset

  gameReset() {
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = '';
    });
  }

//TODO: playgame method

  playgame(int index) {
    if (this.gameState[index] == 'empty') {
      setState(() {
        if (this.iscross) {
          this.gameState[index] = 'cross';
        } else {
          this.gameState[index] = 'circle';
        }
        this.iscross = !this.iscross;
        this.checkWin();
      });
    }
  }

//TODO: check for win (thats to check either elements are in line and daigonal) || wining logic
   checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} Wins';
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} Wins';
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
      });
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} Wins';
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        this.message = 'Draw Game';
      });
    }
  }
     
  

  //TODO: assining of image to the box
  //AssetImage
  getimage(String element) {
    switch (element) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

//TODO: designing of app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OXO'),
      ),
      backgroundColor: Colors.orangeAccent,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: this.gameState.length,
                itemBuilder: (context, i) => SizedBox(
                  height: 50,
                  width: 50,
                  child: MaterialButton(
                    onPressed: () {
                      playgame(i);
                    },
                    child: Image(
                      image: this.getimage(this.gameState[i]),
                    ),
                    splashColor: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                this.message,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              padding: EdgeInsets.all(28),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  gameReset();
                },
                padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.grey,
                splashColor: Colors.white,
                 child: Text(
                  'RESET',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                brand.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.all(25),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
