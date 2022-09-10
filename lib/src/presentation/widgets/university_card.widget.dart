import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tyba_test/src/data/models/university/university.model.dart';

class UniversityCard extends StatelessWidget {
  final bool isTheLastOne;
  final UniversityModel university;
  final GestureTapCallback? onTap;

  const UniversityCard({
    required this.isTheLastOne,
    required this.university,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    final Widget? photo = university.photo == null
        ? null
        : CircleAvatar(
            backgroundImage: Image.memory(
              Uint8List.fromList(university.photo!.codeUnits),
            ).image,
          );

    return Container(
      margin:
          EdgeInsets.only(bottom: isTheLastOne ? mediaSize.height * 0.01 : 0),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(mediaSize.width * 0.01),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(5.0, 5.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
      ),
      child: ListTile(
        leading: photo,
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(mediaSize.width * 0.06),
          child: Material(
            color: theme.colorScheme.secondary,
            child: InkWell(
              splashColor: theme.colorScheme.onSecondary,
              highlightColor: theme.colorScheme.onSecondary,
              onTap: onTap,
              child: Icon(
                Icons.info_outline,
                size: mediaSize.width * 0.07,
              ),
            ),
          ),
        ),
        title: Text(
          university.name,
          style: const TextStyle(color: Colors.black38),
        ),
      ),
    );
  }
}
