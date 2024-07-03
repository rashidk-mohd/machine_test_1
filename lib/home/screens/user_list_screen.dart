import 'package:adss_limited_mechine_test/home/controller/user_controller.dart';
import 'package:adss_limited_mechine_test/home/widget/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    Provider.of<UserConroller>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserConroller>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 95, 40, 105),
        title: const Text('Hi User'),
        // centerTitle: t,
      ),
      body: Center(
        child: data.isLoading
            ? const CircularProgressIndicator()
            : data.bookList.isEmpty
                ? const Center(
                    child: Text("No element"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: data.bookList.length,
                      itemBuilder: (context, index) {
                        final user = data.bookList[index];
                        return TitleDescriptionWidget(
                            userId: user.userId.toString(),
                            id: user.id,
                            description: user.body,
                            title: user.title);
                      },
                    ),
                  ),
      ),
    );
  }
}

