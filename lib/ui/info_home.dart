
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'info_list.dart';

class InfoHome extends HookWidget {
  const InfoHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image List"),
          elevation: 3,
        ),
        body: const InfoList(),
    );
  }
}