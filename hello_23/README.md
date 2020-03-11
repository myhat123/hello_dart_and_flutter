# hello_23

短消息总数和详情数之间有差异，不影响整个运行

storypage.dart

_buildContent(int i) -> ListTile -> title 
maxLines: 2 最多两行，
overflow: TextOverflow.ellipsis 超过部分用省略号...

    title: Text("${_stories[i].title}", 
        style: readFlag ? _hasReadStyle : _biggerFont,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
    ),

newspage.dart

增加评论图标的事件处理 -> CommentPage

IconButton(
    icon: Icon(Icons.mail_outline), 
    onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CommentPage(story)
            )
        );
    },
),

增加commentpage.dart, comment.dart

commentpage 和 hello_08 首页处理很接近，主要是布局 buildRow() 有些差异