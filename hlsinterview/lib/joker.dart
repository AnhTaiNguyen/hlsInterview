import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Widget/customAppBar.dart';
import 'jokeButton.dart';
import 'navBar.dart';

class Joke {
  final String text;
  final String id;
  List<String> votedJokeIds;

  Joke({required this.text, required this.id, required this.votedJokeIds});
}

class JokerPage extends StatefulWidget {
  const JokerPage({Key? key}) : super(key: key);

  @override
  State<JokerPage> createState() => _JokerPageState();
}

class _JokerPageState extends State<JokerPage> {
  late List<Joke> jokes;
  late int currentJokeIndex = 0;

  @override
  void initState() {
    super.initState();
    jokes = [
      Joke(
        id: '1',
        text:
            'A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on." The child then went to his mother, asked her the same question, and she told him, "We were monkeys then we evolved to become like we are now." The child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."',
        votedJokeIds: [],
      ),
      Joke(
        id: '2',
        text:
            'Teacher: "Kids,what does the chicken give you?" Student: "Meat!" Teacher: "Very good! Now what does the pig give you?" Student: "Bacon!" Teacher: "Great! And what does the fat cow give you?" Student: "Homework!"',
        votedJokeIds: [],
      ),
      Joke(
        id: '3',
        text:
            'The teacher asked Jimmy, "Why is your cat at school today Jimmy?" Jimmy replied crying, "Because I heard my daddy tell my mommy, "I am going to eat that pussy once Jimmy leaves for school today!"',
        votedJokeIds: [],
      ),
      Joke(
        id: '4',
        text:
            'A housewife, an accountant and a lawyer were asked "How much is 2+2?" The housewife replies: "Four!". The accountant says: "I think it either 3 or 4. Let me run those figures through my spreadsheet one more time." The lawyer pulls the drapes, dims the lights and asks in a hushed voice, "How much do you want it to be?',
        votedJokeIds: [],
      ),
    ];
    loadVotes();
  }

  Future<void> loadVotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (Joke joke in jokes) {
      joke.votedJokeIds;
    }
  }

  Future<void> voteForJoke(String jokeId, bool liked) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the list of voted joke IDs
    late List<String> votedJokeIds = prefs.getStringList('votedJokeIds') ?? [];

    votedJokeIds.add(jokeId);

    prefs.setStringList('votedJokeIds', votedJokeIds);
  }

  void showNextJoke() {
    setState(() {
      if (jokes.isNotEmpty) {
        currentJokeIndex = (currentJokeIndex + 1) % jokes.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
      ),
      body: jokes.isEmpty
          ? Center(
              child: Text(
                  'That\'s all the jokes for today! Come back another day!'),
            )
          : Column(
              children: [
                Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(16.0),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'A Joke a day keeps the doctor away',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'If you joke the wrong way, your teeth have to pay. Serious)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16.0),
                  child: jokes.isNotEmpty && currentJokeIndex < jokes.length
                      ? Text(jokes[currentJokeIndex].text)
                      : Text('No jokes available'),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    JokerButton(
                      buttonColor: Colors.blue,
                      buttonText: 'This is Funny!',
                      onPressed: () {
                        voteForJoke(jokes[currentJokeIndex].id, true);
                        showNextJoke();
                        loadVotes();
                      },
                    ),
                    SizedBox(width: 16.0),
                    JokerButton(
                      buttonColor: Colors.green,
                      buttonText: 'This is not Funny.',
                      onPressed: () {
                        voteForJoke(jokes[currentJokeIndex].id, true);
                        showNextJoke();
                        loadVotes();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    child: BottomBar(),
                  ),
                ),
              ],
            ),
    );
  }
}
