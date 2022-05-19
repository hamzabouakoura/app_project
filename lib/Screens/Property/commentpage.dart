import 'package:flutter/material.dart';
import 'package:xy2/Screens/Profile/userdata.dart';
import 'package:xy2/Screens/Property/commentbox.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'assets/images/owner.jpg',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'assets/images/owner.jpg',
      'message': 'Very cool'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50, backgroundImage: AssetImage(data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = Userinfo().myuser;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Comments"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color(0xFFe9b7ce),
                Color(0xFFffb88e),
                Color(0xFFabc9e9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: CommentBox(
            userImage: user.userimage,
            child: commentChild(filedata),
            labelText: 'Write a comment...',
            withBorder: false,
            errorText: 'Comment cannot be blank',
            sendButtonMethod: () {
              if (formKey.currentState!.validate()) {
                print(commentController.text);
                setState(() {
                  var value = {
                    'name': user.firstname,
                    'pic': user.userimage,
                    'message': commentController.text
                  };
                  filedata.insert(0, value);
                });
                FocusScope.of(context).unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: formKey,
            commentController: commentController,
            backgroundColor: Colors.black,
            textColor: Colors.black,
            sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
