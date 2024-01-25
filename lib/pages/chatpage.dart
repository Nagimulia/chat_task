import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Color(0Xffc199cd),
                    ),
                  ),
                  SizedBox(
                    width: 90.0,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: GestureDetector(
                        child: Icon(
                          Icons.attach_file,
                          color: Colors.black,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: "Type a message",
                      hintStyle: TextStyle(color: Colors.black45),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.audio_file_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
