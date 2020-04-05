安装使用镜像

```bash
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

```bash
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub/"
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
```

安装 Flutter  
https://flutter.dev/docs/get-started/install  
https://flutter.dev/docs/get-started/install/linux

安装 Android Studio
https://developer.android.google.cn/studio  
下载android sdk, 模拟器

flutter内含dart

体验flutter第一个app  
通过vscode 插件: flutter, dart两个插件

安装stagehand  
> pub global activate stagehand

运行stagehand 和文档不同，注意区别
> pub global run stagehand -h

构建代码框架
> pub global run stagehand console-full

dart语言参考  
https://dartcn.com/  

知乎日报api参考 
https://github.com/iKrelve/KuaiHu/blob/master/知乎日报API.md

hello_01  创建一个dart console程序，带有完整的代码结构  
hello_02  引用第三方库http，异步获取知乎日报数据，打印信息  
hello_03  创建第一个flutter程序，生成默认代码  
hello_04  修改第一个flutter程序，
          来自 https://www.raywenderlich.com/4529993-getting-started-with-flutter  
hello_05  仍然是hello_04的延续，采用http库获取github的api接口信息  
hello_06  自定义类型  
hello_07  重构代码  
hello_08  模仿04-07的示例写知乎日报最新消息展示  
hello_09  回到07示例，继续路由切换  
          来自 https://www.raywenderlich.com/4562634-flutter-navigation-getting-started
          因github api接口涉及到的头像图片无法访问，故只完成前一部分代码  
hello_10  采用flutter_html展示知乎消息，因为存在html标签  
hello_11  合并hello_08, hello_10, 初步完成路由切换  
hello_12  学习flutter布局  
hello_13  学习制作分割线布局  
hello_14  学习ListView.separated  
hello_15  合并hello_14, hello_11, 初步完成分日期显示知乎日报  
hello_16  回到dart学习异步机制  
hello_17  改进知乎日报首页，进行异步方式的代码分离  
hello_18  无限上滑加载知乎日报数据  
hello_19  记录已经浏览过的知乎日报内容  
hello_20  增加上拉延迟处理  
hello_21  增加下拉刷新  
hello_22  消息详情调整布局增加底部栏  
hello_23  增加消息评论页面  
hello_24  进一步学习上滑加载、下拉刷新其它机制处理  
hello_25  结合hello_24，重新调整上滑加载机制  

扩展资料
=======
Flutter原理与实践  
https://tech.meituan.com/2018/08/09/waimai-flutter-practice.html

一个 Demo 入门 Flutter  
https://limboy.me/tech/2018/12/07/flutter-demo.html

其他练习
=======

test_01  学习flutter local notifications  
test_02  继续学习local notifications  
test_03  dart encrypt 加解密  
test_04  python3 cryptography 加解密  