# hello_21

参考资料:

https://www.jianshu.com/p/46bb225c2875
https://kodestat.gitbook.io/flutter/43-flutter-listviewbuilder-with-refresh-indicator

把_setStory() 拆分成 _initStory(), _addStory()

_loadData() -> _initStory(jsonData)
_retrieveData() -> _addStory(jsonData)

_loadData()之前已分离成独立函数
只需在 _onRefresh() 进行调用即可

Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
    Timer(new Duration(seconds: 1), () {
      _loadData();
      completer.complete();
    });
    return completer.future;
}

然后修改 _StoryPageState -> build -> body -> RefreshIndicator

  @override
  Widget build(BuildContext context) => Scaffold (
      appBar: AppBar(
        title: Text('知乎日报 $newsDate'),
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _stories.length,
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
        ),
        onRefresh: _onRefresh,
      ),
    );

physics: const AlwaysScrollableScrollPhysics(),
内容不足一屏时，list可能会滑不动，加上就一直都可以滑动

打包apk，需要对app设置权限

参考资料: https://www.cnblogs.com/joe235/p/11492273.html

android/app/src/profile/AndroidManifest.xml manifest中

<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />

android/src/main/AndroidManifest.xml

设置同样的配置

发布Android版APP https://flutterchina.club/android-release/

keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

hello_21/android/key.properties 文件

文件内容:
  storePassword=123456
  keyPassword=123456
  keyAlias=key
  storeFile=/home/hzg/key.jks