import 'package:firebase_todo/app/modules/home/home_controller.dart';
import 'package:firebase_todo/app/modules/home/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemTile extends StatelessWidget {
  final TodoModel model;
  final Function onTap;

  const ItemTile({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: model.check,
        onChanged: (check) {
          model.check = check;
          Modular.get<HomeController>().save(model);
        },
      ),
      title: Text(model.title),
      trailing: IconButton(
        onPressed: () {
          Modular.get<HomeController>().delete(model);
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      onTap: onTap,
    );
  }
}
