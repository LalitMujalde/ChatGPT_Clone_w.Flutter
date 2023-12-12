// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unused_local_variable

import 'dart:developer';

import 'package:chatgptclone/models/modules_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'constants/constant.dart';
import 'services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Some local constant for this file
  bool isTextFieldFocused = false;
  bool isTyping = false;
  bool titleShow = false;

  // Temp List
  // late TextEditingController model;
  // List<String> tempModelList = [
  //   "Model1",
  //   "Model2",
  //   "Model3",
  //   "Model4",
  //   "Model5",
  // ];
  String? currentModel;
  // List<DropdownMenuItem<String>> get getModelsItems {
  //   List<DropdownMenuItem<String>> modelsItem =
  //       List<DropdownMenuItem<String>>.generate(
  //           tempModelList.length,
  //           (index) => DropdownMenuItem(
  //               value: tempModelList[index],
  //               child: Text(
  //                 tempModelList[index],
  //                 style: TextStyle(fontSize: 15, color: Colors.white),
  //               )));
  //   return modelsItem;
  // }
  // -----------End -----------

  // TextField value
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    var chatmessages = chatMessages;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 27, 33),
      appBar: AppBar(
        title: titleShow ? Text("Flutter Chat") : SizedBox.shrink(),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 29, 27, 33),
        actions: [
          IconButton(
              onPressed: () {
                _modalBottomSheetMenu();
              },
              icon: Icon(Icons.more_vert))
        ],
      ),
      drawer: Drawer(
        width: width,
        backgroundColor: Color.fromARGB(255, 44, 41, 49),
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            ListTile(
              leading: Container(
                width: width * 0.17,
                height: width * 0.17,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image(
                  image: AssetImage('assets/profile.png'),
                  fit: BoxFit.fill,
                  width: width * 0.17,
                  height: width * 0.17,
                ),
              ),
              title: Text(
                "Lalit Mujalde",
                style: TextStyle(fontSize: width * 0.048, color: Colors.white),
              ),
              subtitle: Text(
                "lalitmujalde9@gmail.com",
                style: TextStyle(fontSize: width * 0.048, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Divider(
                    color: Color.fromARGB(255, 196, 196, 196),
                    thickness: 0.7,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    title: Text(
                      "New Chat",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                    title: Text(
                      "History",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Divider(
                    color: Color.fromARGB(255, 196, 196, 196),
                    thickness: 0.7,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.help_center_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Help Center",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Material(
                        color: chatmessages[index]["chatIndex"] == 0
                            ? backgroundcolor
                            : cardcolor,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                chatmessages[index]["chatIndex"] == 0
                                    ? "assets/profile.png"
                                    : "assets/chatGPT_icon.png",
                                width: width * 0.1,
                                height: width * 0.1,
                              ),
                              SizedBox(width: width * 0.03),
                              Expanded(
                                child: Text(
                                  chatmessages[index]["msg"].toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      color: Colors.white),
                                ),
                              ),
                              chatmessages[index]["chatIndex"] == 0
                                  ? SizedBox.shrink()
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.copy_sharp,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: width * 0.005),
                                        Icon(
                                          Icons.thumb_up_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: width * 0.005),
                                        Icon(
                                          Icons.thumb_down_alt_outlined,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.007)
                    ]);
                  })),
          if (isTyping) ...[
            SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            )
          ],
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: width * 0.75,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          isTextFieldFocused = value.isNotEmpty ? true : false;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Message",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 2, color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 2, color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 2, color: Colors.transparent)),
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.mic, color: Colors.white)),
                        fillColor: Color.fromARGB(255, 44, 41, 49),
                      ),
                    )),
                Container(
                  height: width * 0.14,
                  width: width * 0.14,
                  decoration: BoxDecoration(
                      color: isTextFieldFocused
                          ? Color.fromARGB(255, 16, 162, 126)
                          : Color.fromARGB(255, 44, 41, 49),
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                      onPressed: () async {
                        try {
                          log("Request has been sent");
                          await ApiServices.sendMessage(
                              message: textEditingController.text,
                              modelId: modelsProvider.getCurrentModel);
                        } catch (e) {
                          log("Error: $e");
                        }
                      },
                      icon: Icon(Icons.arrow_upward, color: Colors.white)),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          final modelsProvider =
              Provider.of<ModelsProvider>(context, listen: false);
          currentModel = modelsProvider.getCurrentModel;
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          return SizedBox(
            height: height * 0.2,
            child: Container(
                decoration: BoxDecoration(
                    color: cardcolor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.86,
                      child: Text("Choose Model",
                          style: TextStyle(
                            fontSize: width * 0.045,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(height: height * 0.015),
                    Container(
                      width: width * 0.9,
                      padding: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                          child: FutureBuilder<List<ModelsModel>>(
                              future: modelsProvider.getAllModels(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                      child: Text(snapshot.error.toString()));
                                }
                                return snapshot.data == null ||
                                        snapshot.data!.isEmpty
                                    ? SizedBox.shrink()
                                    : FittedBox(
                                        child: DropdownButton(
                                            alignment: Alignment.center,
                                            dropdownColor: cardcolor,
                                            items: List<
                                                    DropdownMenuItem<
                                                        String>>.generate(
                                                snapshot.data!.length,
                                                (index) => DropdownMenuItem(
                                                    value: snapshot
                                                        .data![index].id,
                                                    child: Text(
                                                      snapshot.data![index].id!,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                    ))),
                                            value: currentModel,
                                            onChanged: (value) {
                                              setState(() {
                                                currentModel = value.toString();
                                              });
                                              modelsProvider.setCurrentModel(
                                                  value.toString());
                                            }),
                                      );
                              })),
                    )
                  ],
                )),
          );
        });
  }
}
