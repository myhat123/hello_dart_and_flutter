# hello_22

去除 AppBar
增加 BottomAppBar

bottomNavigationBar: BottomAppBar(
    child: Container(
        padding: EdgeInsets.all(6.0),
        child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
            Container(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios), onPressed: () {
                Navigator.pop(context);
                },
            ),
            decoration: BoxDecoration(
                border: Border(
                right: BorderSide(width: 0.5, color: Colors.grey),
                )
            )
            ),

            Expanded(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,  
                verticalDirection: VerticalDirection.down,
                children: [
                IconButton(icon: Icon(Icons.mail_outline), onPressed: () {},),
                Container(
                    padding: EdgeInsets.only(top:10.0),
                    child: Text(shortCommentsNum != null ? shortCommentsNum.toString() : ''),
                )
                ]
            ),
            ),
        ]
        )
    ),
),
