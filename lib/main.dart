import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Man Utd Player list',
            style: TextStyle(color: Colors.black87, fontSize: 24)),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          ),
        ],
      ),
      body: _lista(),
    );
  }

  Widget _checkboxRow() {
    return Checkbox(
      value: false,
      onChanged: (val) {},
    );
  }

  Widget _lista() {
    var list = [
      'David Beckham',
      'Teddy Sheringham',
      'Ole Gunnar Solskjaer',
      'Peter Schmeichel',
      'Jesper Blomqvist',
      'Nicky Butt',
      'Gary Neville',
      'Eric Cantona',
    ];

    return ListView(
      children: list.map((item) => _item(item)).toList(),
    );
  }

  Widget _item(text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _checkboxRow(),
          Text(text, style: TextStyle(fontSize: 20)),
          IconButton(
            onPressed: () {
              print('hej');
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _nameInputField(),
          Container(height: 24),
          _buttonRow(),
        ],
      ),
    );
  }

  Widget _nameInputField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(hintText: 'Add player'),
      ),
    );
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Text('Cancel'),
        ),
        Container(width: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text('Save'),
        ),
      ],
    );
  }
}
