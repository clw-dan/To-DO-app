import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();

}

class _TodoAppState extends State<TodoApp> {
  TextEditingController myController = TextEditingController();

  List<String> myLIst = [];
  @override
  void addTask() {
    if (myController.text.isNotEmpty) {
      setState(() {myLIst.add(myController.text);
        myController.clear();
      });
    }
  }
  void deleteTask(int index) {
    setState(() {
      myLIst.removeAt(index);
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List',style:
          TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body:
      Padding(
          padding:
          EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: 'Type IN heRE...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.edit),
              ),
              onSubmitted: (value)  => addTask(),
            ),
            SizedBox(height: 25,),
            SizedBox(width: double.infinity,
            child: ElevatedButton(onPressed: addTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: EdgeInsets.symmetric(vertical: 15)
                ),
                child: Text('ADD TAsk',
                style: TextStyle(color: Colors.white,  fontSize: 30),)),
            ),
            SizedBox(
              height: 10
            ),
            Text('You have ${myLIst.length}task(s)',
            style: TextStyle(
              fontSize: 25, color: Colors.red,
            ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: myLIst.isEmpty
            ? Center(
              child: Text('No tasks yet. \nAdd one above',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,color: Colors.purple,
                ),
            ),
            )
                : ListView.builder(itemCount: myLIst.length,
            itemBuilder: (context, index)  {
                  return Card(
                    margin: EdgeInsets.only(bottom: 10),
                    child:
                    ListTile(
                      leading:
                      CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        child: Text('${index + 1}',
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                      ),
                      title: Text(myLIst[index]),
                      trailing: IconButton(
                          icon:Icon(Icons.delete, color: Colors.red,),
                          onPressed: () => deleteTask(index),
                    ),
                    ));
            },
            )
            ) ],
        ),
      ),
    );
  }
}

