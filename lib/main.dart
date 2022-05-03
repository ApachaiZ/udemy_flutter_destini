import 'package:flutter/material.dart';
import 'package:udemy_flutter_destini/data/story_brain.dart';

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int storyNumber = 0;

  void nextStory(int nb) {
    setState(() {
      //Refer to the map for logical choices
      storyNumber == 0
          ? (nb == 1 ? storyNumber = 2 : storyNumber = 1)
          : (nb == 2
              ? storyNumber += 2
              : (storyNumber == 1 ? storyNumber = 2 : storyNumber = 5));
    });
  }

  void restartStory() {
    setState(() => storyNumber = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            //Setting global background for the app
            image: AssetImage("images/background.png"),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(storyNumber),
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () =>
                      storyNumber < 3 ? nextStory(1) : restartStory(),
                  child: Text(
                    storyBrain.getChoice1(storyNumber),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible:  storyBrain.getChoice2(storyNumber).length > 0 ? true : false,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () =>
                        storyNumber < 3 ? nextStory(2) : restartStory(),
                    child: Text(
                      storyBrain.getChoice2(storyNumber),
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}