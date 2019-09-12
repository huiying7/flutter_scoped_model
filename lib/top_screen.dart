import 'package:flutter_scoped_model/Model/count_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scoped_model/under_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class TopScreen extends StatefulWidget {
  @override
  __TopScreenState createState() => __TopScreenState();
}

class __TopScreenState extends State<TopScreen> {
  ///静态获取Model用法实例
  Model getModel(BuildContext context) {
    /**
     * 第二种获取model的方式  ScopedModel.of
     * 或者在Model中重写of方法
     */
    final countModel = ScopedModel.of<CountModel>(context);
//    final countModel2 = CountModel().of(context);
    countModel.increment();
//    countModel2.increment();
    return countModel;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Top Screen'),
          ),
          body: Center(
            child: Text(
              model.count.toString(),
              style: TextStyle(fontSize: 48),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return UnderScreen(
                  title: 'Under Screen',
                );
              }));
            },
            child: Icon(Icons.forward),
          ),
        );
      },
    );
  }
}
