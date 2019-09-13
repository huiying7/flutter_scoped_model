import 'package:flutter/material.dart';
import 'package:flutter_scoped_model/under_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_scoped_model/model/count_model.dart';


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
     *
     * ScopedModel是一个用于保存Model的Widget.通过ScopedModel会一个
     * 应用的入口处作为父布局使用,并以Model作为参数传入,使得ScopedModel持有Model
     * 在ScopedModel的子布局中,可以通过ScopedModel.of<Model>(context)方法获取Model
     */
    final countModel = ScopedModel.of<CountModel>(context);
//    final countModel2 = CountModel().of(context);
    countModel.increment();
//    countModel2.increment();
    return countModel;
  }

  @override
  Widget build(BuildContext context) {
    /// ScopedModelDescendant是ScopedModel的派生物.也是一个Widget.
    /// ScopedModelDescendant会作为ScopedModel下的子布局存在,它主要作用是响应状态更新
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
