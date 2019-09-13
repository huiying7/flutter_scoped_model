# flutter_scoped_model

A new Flutter application.

## scoped_model简介

- **Model**

    `Model` 是封装状态和状态操作的地方.我们可以将想要的数据存放在`Model`当中并且将对数据操作.`Model`还提供了`notifyListeners()`方法,它的作用是当数据发生改变时,可以通过调用`notifyListeners()`方法通知界面进行更新.

- **ScopedModel**

    `ScopedModel`是一个用于保存`Model`的`Widget`.通常`ScopedModel`是一个应用的入口处作为入口处作为父布局使用,并以`Model`作为参数传入,使得`ScopedModel`持有`Model`.在`ScopedModel`的子布局中,可以通过`ScopedModel.of<Model>(context)`方法来获取`Model`.

- **ScopedModelDescendant**
    `ScopedModelDescendant`,顾名思义,是`ScopedModel`的派生物.同样的,它也是一个`Widget`.`ScopedModelDescendant`会作为`ScopedModel`下的子布局存在,它的主要作用是响应状态更新.`ScopedModelDescendant`中存在`builder`函数,这个函数会在`Model`的`notifyListeners()`发生时被调用,从而根据`Model`中的数据生成相应的界面.