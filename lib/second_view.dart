
import 'package:flutter/material.dart';
import 'package:my_first_app/main_view.dart';
import './state.dart';
import './main_view.dart';
import 'package:provider/provider.dart';
import './player_list.dart';


class SecondView extends StatelessWidget {
  
   final TextEditingController textcontroller = TextEditingController(); 
  
   String text = '';
   
   @override
   Widget build(BuildContext context) {
     return Scaffold(
     appBar: AppBar(title: Text('Add new Man Utd player'), actions: [
     ElevatedButton(
     child: Text('Save'),
     onPressed: () {
       if (inputValidation(textcontroller.text) != true) {
              var snackBar = const SnackBar(
                content: Text(
                  'Error! Missing text.',
                  textAlign: TextAlign.center,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
     
      } else {
        text = textcontroller.text;
     Provider.of<MyState>(context, listen: false).addText(Player(message: text));
     textcontroller.clear();
      var snackBar = const SnackBar(
                content: Text(
                  'Player added',
                  textAlign: TextAlign.center,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

      }
     }
    ),
 ]),
     
             
          
      body: Column(
        children: [
          _nameInputField(),
          Container(height: 24),
        
        ],
      ),
    );
  }

  Widget _nameInputField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        controller: textcontroller,
        decoration: InputDecoration(hintText: 'Player name'),
      ),
      
    );
  

  }
  bool inputValidation(inputText) {
    String text = inputText;
    RegExp upperCase = RegExp(r'[A-Z]');
    RegExp lowerCase = RegExp(r'[a-z]');
    if (text.contains(upperCase) || text.contains(lowerCase)) {
      return true;
    } else {
      return false;
    }
  }
}
