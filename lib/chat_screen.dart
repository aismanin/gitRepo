import 'package:flutter/material.dart';
import 'chat_message.dart';


class ChatScreen extends StatefulWidget{
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen>{

  final TextEditingController _textEditingController = TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];  //empty list

  void _handleSubmitted(String text){
    _textEditingController.clear();
    ChatMessage message = ChatMessage(text: text);

    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposeWidget() {
    return IconTheme(
      data: const IconThemeData(
        color: Colors.blue
      ),

      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(

            children: [
              Flexible(
                  child: TextField(
                decoration: const InputDecoration.collapsed(hintText: "Type a message"),
                controller: _textEditingController,
                //onSubmitted: _handleSubmitted,  //it's not working
              )
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),

                child: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _handleSubmitted(_textEditingController.text);
                  },
                ),

              )
            ],
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),

              reverse: true,

              itemBuilder: (_, int index) {
                return _messages[index];
              },

              itemCount: _messages.length,
            )
        ),

        Divider(height: 1),

        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor
          ),

          child: _textComposeWidget(),
        )
      ],
    );
  }
}