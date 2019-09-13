import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_scoped_model/model/count_model.dart';

class UnderScreen extends StatefulWidget {
  UnderScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UnderScreenState createState() => _UnderScreenState();
}

class _UnderScreenState extends State<UnderScreen> {
  @override
  Widget build(BuildContext context) {
    /**
     * scoped_model提供了两种方式在子页面中获取model。
     * 第一种 ScopedModelDescendant
     * ScopedModelDescendant({
        @required this.builder,
        this.child,
        this.rebuildOnChange = true,
        });

        final ScopedModelDescendantBuilder<T> builder;
        typedef Widget ScopedModelDescendantBuilder<T extends Model>(
        BuildContext context,
        Widget child,
        T model,
        );
        在builder中能够通过model来获取CountModel实例
     */
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${model.count}",
                  style: TextStyle(fontSize: 36.0),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
//        rebuildOnChange 属性能够控制当该状态发生变化时，是否rebuild，作用等同于setState。
//    也就是说我们调用改变状态的一些方法时，不必在setState
//      rebuildOnChange: ,
    );
  }
}
