import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mai_app/features/docList/widgets/doc_widget.dart';
import 'package:mai_app/helpers/constants.dart';
import 'package:mai_app/helpers/window_props.dart';
import 'package:mai_app/model/doc_model.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  List<DocumentModel> docList = []; 

  @override
  void initState() {
    super.initState();
    getDocs();
  }

  Future<void> getDocs() async {
    setState(() {
      docList = [];
    });
    await FirebaseFirestore.instance.collection("data").get().then(
      (value) {
        final docs = value.docs;
        docs.forEach((element) {
          final data = element.data();
          docList.add(
            DocumentModel.fromJson(data)
          );
        });
      }
    );
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
        title: const Text('Список из доступных документов', 
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: getDocs,
        child: Center(
          child: docList.isEmpty 
            ? const CircularProgressIndicator() 
            : Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text('Всего найдено: ${docList.length} док.',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50
                  ),
                  child: Container(
                    width: width*0.6,
                    height: height*0.7,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 32, 82, 85)
                      )
                    ),
                    child: GridView.count(
                        crossAxisCount: 2,
                        physics: const BouncingScrollPhysics(),
                        crossAxisSpacing: 50,
                        mainAxisSpacing: 50,
                        children: [
                          ...List.generate(docList.length, 
                            (index) {
                              return DocWidget(doc: docList[index]);
                            }
                          )
                        ],
                      ),
                  ),
                ),
              ],
            )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getDocs, 
        backgroundColor: kLime,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)
        ),
        label: const Icon(Icons.refresh, color: kGrey,)
      ),
    );
  }
}