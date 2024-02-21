import 'dart:developer';

import 'package:flutter/material.dart';

class CategoryDetails extends StatefulWidget {
  final item;
  const CategoryDetails({super.key, this.item});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    log("image----${widget.item}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Details"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Hero(
                  tag: 'background',
                  child: Image.asset(widget.item['image_path'])),
              const SizedBox(height: 20),
              Text(
                widget.item['name'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 15),
              Text(
                widget.item['details'],
                style: const TextStyle(fontSize: 15),
                maxLines: 3,
              ),
              const SizedBox(height: 15),
              Text(
                "Price: ${widget.item['price']} ",
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
