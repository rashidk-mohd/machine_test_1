import 'package:adss_limited_mechine_test/home/controller/user_controller.dart';
import 'package:adss_limited_mechine_test/utils/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({
    super.key,
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
  });
  final String? userId;
  final String? id;
  final String? title;
  final String? description;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  String? userName;
  bool isLoading=false;
  @override
  void initState() {
    getUserName();
    super.initState();
  }

  getUserName() async {
    setState(() {
      isLoading=true;
    });
    var controller = Provider.of<UserConroller>(context, listen: false);
    var data = await controller.getDataWithPostID(id: widget.userId);
    var q = data.firstWhere((element) => element.id.toString() == widget.id);
    controller.getUserDetails(id: q.id.toString());
    setState(() {
      userName = q.name;
      isLoading=false;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 95, 40, 105),
          title: const Text('User '),
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back)),
        ),
        body:isLoading?const Center(child: CircularProgressIndicator(),): Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Title : ${widget.title ?? ""}",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14.0),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.userDetailsScreen);
                },
                child: Text(
                  "Author: ${userName ?? ""}",
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               const SizedBox(height: 14.0),
              Container(
                padding: const EdgeInsets.all(20.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        widget.description ?? "",
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
