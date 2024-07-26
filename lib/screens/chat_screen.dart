import 'dart:ui';

import 'package:chat_bot_app/model/message_model.dart';
import 'package:chat_bot_app/utils/util_helper.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  String query;

  ChatScreen({required this.query});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MessageModel> listMsg = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listMsg.add(MessageModel(
      msg: widget.query,
      sendId: 0,
      sendAt: DateTime.now().millisecondsSinceEpoch.toString(),
    ));
    listMsg.add(MessageModel(
      msg: "This is the response of your query on the given question",
      sendId: 1,
      sendAt: DateTime.now().millisecondsSinceEpoch.toString(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          body: Column(
            children: [
              Container(
                color: AppColors.secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Dig",
                              style: mTextStyle16(mColor: Colors.white),
                              children: [
                            TextSpan(
                                text: "IT",
                                style: mTextStyle16(
                                    mFontWeight: FontWeight.w900,
                                    mColor: Colors.amber))
                          ])),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/chat_reply.png',
                            width: screenwidth * 0.06,
                          ),
                          SizedBox(
                            width: screenwidth * 0.02,
                          ),
                          Text(
                            "Bot",
                            style: mTextStyle25(
                                mColor: Colors.grey,
                                mFontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                        height: screenheight * 0.05,
                        width: screenwidth * 0.08,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mGreyColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.face_unlock_sharp,
                            color: Colors.white,
                            size: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    reverse: true,
                itemCount: listMsg.length,
                itemBuilder: (context, index) {
                  return listMsg[index].sendId == 0
                      ? UserChatBox(listMsg[index])
                      : BotChatBox(listMsg[index]);
                },
              )),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: TextField(
                  style: mTextStyle16(mColor: Colors.grey),
                  maxLines: 1,
                  minLines: 1,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mic, color: Colors.grey),
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.send,
                          color: Colors.grey,
                        )),
                    fillColor: AppColors.secondaryColor,
                    filled: true,
                    hintText: "Write a question!",
                    hintStyle: mTextStyle16(mColor: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0), // Adjust padding as needed
                  ),
                ),
              ),
            ],
          )),
    );
  }

  //rightSideBox
  Widget UserChatBox(MessageModel msgModel) {
    return Container(
      padding: EdgeInsets.all(11),
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(11),
            topRight: Radius.circular(11),
            bottomLeft: Radius.circular(11),
          )),
      child: Text(msgModel.msg!,style: mTextStyle16(mColor: Colors.grey),),
    );
  }

  //leftSideBox
  Widget BotChatBox(MessageModel msg) {
    return Container(
      decoration: BoxDecoration(color: AppColors.secondaryColor),
    );
  }
}
