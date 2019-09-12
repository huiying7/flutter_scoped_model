import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_scoped_model/model/count_model.dart';
import 'package:flutter_scoped_model/top_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ///创建顶层状态
  CountModel countModel = CountModel();

  @override
  Widget build(BuildContext context) {
    /**
     * ScopedModel<T extends Model> extends StatelessWidget，它接收一个model，并提供给需要它的所有部件。
     * ScopedModel<T extends Model>的model属性绑定我们的CountModel对象。
     */
    return ScopedModel<CountModel>(
      model: countModel,
      child: MaterialApp(
        title: 'FLutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TopScreen(),
      ),
    );
  }
}
