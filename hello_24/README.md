# hello_24

参考资料

https://www.jianshu.com/p/73a83e525743

下拉刷新

RefreshIndicator，用于实现下拉刷新功能，之前的示例均是采用这种方式
使用时，我们需要用RefreshIndicator去包裹ListView，并指定下拉刷新回调方法onRefresh

上滑加载

之前采用的是判定是否在ListView的最后一个位置来决定上滑操作
但这种方式有些瑕疵，最后一个未显示，需要上滑之后，与下一个过往日期的知乎消息一起展示

    itemBuilder: (BuildContext context, int position) {  
        if (position == _stories.length-1) {
            _retrieveData();
            return Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0)
            ),
            );
        }
        return _buildRow(position);
    }

利用NotificationListener实现上拉加载更多

NotificationListener是一个Widget，可以监听子Widget发出的Notification。ListView在滑动的过程中会发出
ScrollNotification类型的通知，我们可以通过监听该通知得到ListView的滑动状态，判断是否滑动到了底部。
NotificationListener有一个onNotification属性，定义了监听的回调方法，通过它来处理加载更多逻辑。
