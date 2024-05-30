import 'package:flutter/material.dart';
import 'package:mai_app/helpers/constants.dart';
import 'package:mai_app/model/doc_model.dart';

class DocWidget extends StatelessWidget {
  const DocWidget({super.key, required this.doc});
  final DocumentModel doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kGrey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 5,
          color: kLime
        )
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('ID', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          Row(
            children: [
              Flexible(
                child: Text('<${doc.id}>', 
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Text', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          Row(
            children: [
              Flexible(
                child: Text(doc.text, 
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}