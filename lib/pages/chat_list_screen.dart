import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:chat_on/pages/translator.dart';
import 'package:shared_preferences/shared_preferences.dart';

var currentUserEmail;

class ChatMessageListItem extends StatelessWidget {
  final DataSnapshot messageSnapshot;
  final Animation animation;
  String translatedText = "";

  ChatMessageListItem({this.messageSnapshot, this.animation});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor:
          new CurvedAnimation(parent: animation, curve: Curves.decelerate),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          children: currentUserEmail == messageSnapshot.value['email']
              ? getSentMessageLayout()
              : getReceivedMessageLayout(),
        ),
      ),
    );
  }

  List<Widget> getSentMessageLayout() {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(messageSnapshot.value['senderName'],
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: messageSnapshot.value['imageUrl'] != null
                  ? new Image.network(
                      messageSnapshot.value['imageUrl'],
                      width: 250.0,
                    )
                  : new Text(messageSnapshot.value['text']),
            ),
          ],
        ),
      ),
      new Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: new CircleAvatar(
                backgroundImage:
                    new NetworkImage(messageSnapshot.value['senderPhotoUrl']),
              )),
        ],
      ),
    ];
  }

  List<Widget> getReceivedMessageLayout() {
    return <Widget>[
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: new CircleAvatar(
                backgroundImage:
                    new NetworkImage(messageSnapshot.value['senderPhotoUrl']),
              )),
        ],
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(messageSnapshot.value['senderName'],
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: messageSnapshot.value['imageUrl'] != null
                    ? new Image.network(
                        messageSnapshot.value['imageUrl'],
                        width: 250.0,
                      )
                    : FutureBuilder(
                        future: getTranslatedText(messageSnapshot),
                        builder: (context, snapshot) {
                          return snapshot.connectionState == ConnectionState.done?Center(child: Text(
                            snapshot.data/*==null?messageSnapshot.value['text']:snapshot.data,
                            textAlign: TextAlign.center,*/
                          )):new Center(child: CircularProgressIndicator());
                          /*Center(
                              child: Text(
                                snapshot.data,
                                textAlign: TextAlign.center,
                              ));*/

                        })
                //translatedText.isEmpty?new Text(setVal(messageSnapshot)):new Text(translatedText),
                ),
          ],
        ),
      ),
    ];
  }

  Future<String> getTranslatedText(messageSnapshot) async {
    String textRec = messageSnapshot.value['text'];
    Translator translator = new Translator();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('rec_lang');
    return translator.translate(lang, textRec);
  }

  /*String setVal(messageSnapshot){
    getTranslatedText(messageSnapshot.value['text']).then((val) => translatedText = val);
    return messageSnapshot.value['text'];

  }*/

}
