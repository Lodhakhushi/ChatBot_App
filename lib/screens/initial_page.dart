import 'package:chat_bot_app/screens/app_constant.dart';
import 'package:chat_bot_app/screens/chat_screen.dart';
import 'package:chat_bot_app/utils/util_helper.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final islandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    TextEditingController queryController=new TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              Row(
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
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.messenger_outline,
                    color: Colors.grey,
                    size: 16,
                  ),
                  RichText(
                      text: TextSpan(
                        text: "New Chat",
                        style: mTextStyle12(mColor: Colors.white),
                      )),
                  SizedBox(
                      width: islandscape
                          ? screenwidth * 0.85
                          : screenwidth * 0.50),
                  Row(
                    children: [
                      const Icon(
                        Icons.history,
                        color: Colors.grey,
                        size: 16,
                      ),
                      RichText(
                          text: TextSpan(
                            text: "History",
                            style: mTextStyle12(mColor: Colors.white),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenheight * 0.02,
              ),
              SizedBox(
                width: islandscape ? screenwidth * 0.9 : screenwidth * 0.89,
                child: TextField(
                  controller: queryController,
                  onEditingComplete: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ChatScreen(query: queryController.text);
                    },));
                  },
                  onSubmitted: (value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ChatScreen(query: value);
                    },));

                  },
                  style: mTextStyle16(mColor: Colors.grey),
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mic, color: Colors.grey),
                    suffixIcon: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ChatScreen(query: queryController.text);
                        },));
                      },
                        child: Icon(Icons.send,color: Colors.grey,)),
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
              SizedBox(
                height: screenheight * 0.02,
              ),
              SizedBox(
                height: 40,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: AppConstant.defaultQues.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            selectedIndex = index;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 11),
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Center(
                              child: Text(
                                AppConstant.defaultQues[index]['title'],
                                style: mTextStyle12(
                                    mColor: index == selectedIndex
                                        ? Colors.amber
                                        : Colors.grey,
                                    mFontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: index == selectedIndex
                                    ? Border.all(color: Colors.amber)
                                    : Border.all(width: 0)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: screenheight * 0.02,
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxiscount = constraints.maxHeight > 600 ? 3 : 2;
                    return GridView.builder(
                      itemCount: AppConstant.defaultQues[selectedIndex]['ques'].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxiscount,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        Map<String, dynamic> currItem = AppConstant.defaultQues[selectedIndex]['ques'][index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ChatScreen(query: currItem['ques']);
                            },));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 11),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Align(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 16),
                                      height: screenheight * 0.05,
                                      width: screenwidth * 0.07,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currItem['color'],
                                      ),
                                      child: Center(
                                        child: Icon(
                                          currItem['icon'],
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    currItem['Ques'],
                                    style: mTextStyle12(
                                        mFontWeight: FontWeight.bold,
                                        mColor: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(21),
                                color: AppColors.secondaryColor),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
