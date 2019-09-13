import 'package:scoped_model/scoped_model.dart';

///Model是封装状态和状态操作的地方.
class CountModel extends Model {
  int _count = 0;

  get count => _count;

  void increment() {
    _count++;
    ///当数据发生改变时,通知界面进行更新
    notifyListeners();
  }

  ///第二种获取model的方式 使用ScopedModel.of
  ///或者在Model中重写of方法
//  CountModel of(context) => ScopedModel.of<CountModel>(context);
}
