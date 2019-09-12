import 'package:scoped_model/scoped_model.dart';

///在Scoped中，Model是一个只包含与状态相关信息的单位。
///我们应该把状态数据与操作数据的方法抽象出来封装到Model中。
/// 我们需要让自定义的CountModel继承Model
/// 在状态发生变化时(increment)通知所有用到了该model的子项更新状态。(notifyListeners)
///
/// scoped是如何做到同步不同页面中的状态的
/// bstract class Model extends Listenable {
///    final Set<VoidCallback> _listeners = Set<VoidCallback>();
///    int _version = 0;
///    int _microtaskVersion = 0;
///
///    /// [listener] will be invoked when the model changes.
///    @override
///    void addListener(VoidCallback listener) {
///    _listeners.add(listener);
///    }
/// Model实现了Listenable接口，并重写了addListener 实现观察者模式
/// 每当我们调用notifyListeners方式时，将会通知观察者更新状态
///
///
/// scoped如何做到数据能够相互共享的
/// 在不同页面间的数据传递使用了InheritedWidget
/// /// Provides [model] to its [child] [Widget] tree via [InheritedWidget].  When
///// [version] changes, all descendants who request (via
///// [BuildContext.inheritFromWidgetOfExactType]) to be rebuilt when the model
///// changes will do so.
//class _InheritedModel<T extends Model> extends InheritedWidget {
//  final T model;
//  final int version;
//
//  _InheritedModel({Key key, Widget child, T model})
//      : this.model = model,
//        this.version = model._version,
//        super(key: key, child: child);
//
//  @override
//  bool updateShouldNotify(_InheritedModel<T> oldWidget) =>
//      (oldWidget.version != version);
//}
class CountModel extends Model {
  int _count = 0;

  get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  ///第二种获取model的方式 使用ScopedModel.of
  ///或者在Model中重写of方法
//  CountModel of(context) => ScopedModel.of<CountModel>(context);
}
