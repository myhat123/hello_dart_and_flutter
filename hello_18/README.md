# hello_18

增加endDate作为最后截止日期，作为分界线
在hello_17中分离了loadBeforeData(endDate)

增加_buildContent(i) 进一步分离，缩减_buildNoSepRow，_buildTopSetRow重复代码
增加_retrieveDate()函数 获取一天的数据

在ListView.builder中 itemBuilder 增加一段继续获取数据的代码

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
