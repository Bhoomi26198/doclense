import 'package:doclense/constants/app_strings.dart';
import 'package:doclense/widget/common.dart';
import 'package:flutter/material.dart';

var arrayNames = [
  'Notification 1',
  'Notification 2',
  'Notification 3',
  'Notification 4',
  'Notification 5',
  'Notification 6',
  'Notification 7',
  'Notification 8',
  'Notification 9',
  'Notification 10',
];

var description = [
  'Contrary to popular belief, Lorem Ipsum is not simply random text.',
  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable.',
  'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
  'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
  'Contrary to popular belief, Lorem Ipsum is not simply random text.',
  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable.',
  'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
  'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
];

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(AppStrings.notification),
        body: SizedBox(
            child: Container(
          margin: const EdgeInsets.all(12),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  arrayNames[index],
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'FontMain'),
                ),
                subtitle: Text(description[index]),
              );
            },
            itemCount: arrayNames.length,
            separatorBuilder: (context, index) {
              return const Divider(
                height: 20,
                thickness: 2,
              );
            },
          ),
        )));
  }
}
