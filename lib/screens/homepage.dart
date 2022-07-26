import 'package:flutter/material.dart';
import 'package:quiz_app/screens/constants.dart';


class homepage extends StatefulWidget {
  const homepage({ Key? key }) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Q${index + 1}. ${questions[index].question}",
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black
          ),),
          SizedBox(height: 15,),
          ListTile(
            onTap: (){
              verifyAnswer(0, questions[index].correctOption);
            },
            title: Text('1. ${questions[index].options[0]}'),
          ),
          Divider(),
          ListTile(
            onTap: (){
              verifyAnswer(1, questions[index].correctOption);
            },
            title: Text('2. ${questions[index].options[1]}'),
          ),
          Divider(),
          ListTile(
            onTap: (){
              verifyAnswer(2, questions[index].correctOption);
            },
            title: Text('3. ${questions[index].options[2]}'),
          ),
          Divider(),
          ListTile(
            onTap: (){
              verifyAnswer(3, questions[index].correctOption);
            },
            title: Text('4. ${questions[index].options[3]}'),
          ),
        ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
          index++;
          index = index%questions.length;
        });
        },
        child: Icon(Icons.navigate_next, size: 35,),
      ),
    );
  }
  verifyAnswer(int chosenOption, int correctOption){
    if(chosenOption == correctOption){
      final snackbar = SnackBar(
        content: Text('correct answer ^_^'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),);
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        
        setState(() {
          index++;
          index = index%questions.length;
        });
    }else{
      final snackbar = SnackBar(
        content: Text('wrong answer :('),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),);
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}