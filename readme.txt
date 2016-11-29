app-server接口说明：
*****************************************************************************************
*****关于自定义消息json(群组操作和好友操作)格式示例：
{
"type":1,
"content":"content"
}
自定义消息json中的type字段含义值如下：
1：//加入群组审核
2：//更新群信息
3：//加入群审核结果
4：//退出群组
5：//群组踢人
6：//好友申请审核
7：//好友申请审核结果
8：//移除好友
9：//群组解散
10：//创建群组

*****************************************************************************************

一.用户接口
1.注册用户
http post url：http://10.125.3.61:8080/app-server/user/registerUser.json
请求参数示例：
{
"phoneNumber": "15011111113", //必要
"userName": "小李", //必要
"password": "password", //必要
"nickName": "john", //必要
"avatar": "avatar",
"gender": 0,
"region": "北京",
"birthday": 1223,
"autograph": "autograph",
"mobileClientId": 0,
"pcClientId": 0
}
返回参数示例：
{
"message": "注册成功",
"code": 0,
"data": {
"id": 75,
"appId": "TEST_APP_ID",
"phoneNumber": "15011111113",
"userName": "小李",
"password": "password",
"nickName": "john",
"avatar": "avatar",
"gender": 0,
"region": "北京",
"birthday": 1223,
"autograph": "autograph",
"createTime": 1456891168485,
"updateTime": 1456891168485,
"imUserId": 3,
"token": "3efd3b698249463998f379088f1c13ec",
"tokenValidity": 1457495968947,
"mobileClientId": 0,
"pcClientId": 0
}
}
2.获取用户信息
http post url：http://10.125.3.61:8080/app-server/user/getUserInfo.json
请求参数示例：
{ "id":75 }

返回参数示例：
{
"message": "获取信息成功",
"code": 0,
"data": {
"id": 75,
"appId": "TEST_APP_ID",
"phoneNumber": "15011111113",
"userName": "小李",
"password": "password",
"nickName": "john",
"avatar": "avatar",
"gender": 0,
"region": "北京",
"birthday": 1223,
"autograph": "autograph",
"createTime": 1456891168485,
"updateTime": 1456891168485,
"imUserId": 3,
"token": "3efd3b698249463998f379088f1c13ec",
"tokenValidity": 1457495968947,
"mobileClientId": 0,
"pcClientId": 0
}
}
3.用户登录
http post url：http://10.125.3.61:8080/app-server/user/login.json
请求参数示例：
{
"phoneNumber": "15011111113",
"password": "password"
}

返回参数示例：
{
"message": "登录成功",
"code": 0,
"data": {
"id": 75,
"appId": "",
"phoneNumber": "15011111113",
"userName": "小李",
"password": "password",
"nickName": "john",
"avatar": "avatar",
"gender": 0,
"region": "北京",
"birthday": 1223,
"autograph": "autograph",
"createTime": 1456891168485,
"updateTime": 1456891168485,
"imUserId": 3,
"token": "3efd3b698249463998f379088f1c13ec",
"tokenValidity": 1457495968947,
"mobileClientId": 0,
"pcClientId": 0
}
}

4.查询用户
http post url：http://10.125.3.61:8080/app-server/user/findUser.json
请求参数示例：
{
"phoneNumber": "150111111111"
}
返回参数示例：
{
"message": "获取信息成功",
"code": 0,
"data": {
"id": 75,
"appId": "TEST_APP_ID",
"phoneNumber": "15011111113",
"userName": "小李",
"password": "password",
"nickName": "john",
"avatar": "avatar",
"gender": 0, // 0:男 1:女
"region": "北京",
"birthday": 1223,
"autograph": "autograph", //个性签名
"createTime": 1456891168485,
"updateTime": 1456891168485,
"imUserId": 3,
"token": "3efd3b698249463998f379088f1c13ec",
"tokenValidity": 1457495968947,
"mobileClientId": 0,
"pcClientId": 0
}
}

5.更新用户信息
http post url：http://10.125.3.61:8080/app-server/user/updateUserInfo.json
请求参数示例：
{
"userName": "小李", //必要
"nickName": "john", //必要
"avatar": "avatar",
"gender": 0,
"region": "北京"
}

返回参数示例：
{
"message": "注册成功",
"code": 0,
"data": {
"id": 75,
"appId": "TEST_APP_ID",
"phoneNumber": "15011111113",
"userName": "小李",
"password": "password",
"nickName": "john",
"avatar": "avatar",
"gender": 0,
"region": "北京",
"birthday": 1223,
"autograph": "autograph",
"createTime": 1456891168485,
"updateTime": 1456891168485,
"imUserId": 3,
"token": "3efd3b698249463998f379088f1c13ec",
"tokenValidity": 1457495968947,
"mobileClientId": 0,
"pcClientId": 0
}
}



二.群组操作接口说明
1.创建群组：
http post url：http://10.125.3.61:8080/app-server/group/addGroup.json
请求参数示例：
{
"uid": 69, //必要
"nickName": "小李", //必要
"groupName": "群组测试", //必要
"desc": "群描述",
"avatar": "群头像的地址",
"isAudit": 1, //是否需要群审核 1：需要 0：不需要
"capacity": 200,
"members": [
{
"uid": 3,
"imUserId":3,
"userName": "tom1"
},
{
"uid": 4,
"imUserId":3,
"userName": "tom2"
}
]//必要
}

返回参数示例：
{
"message": "创建成功",
"code": 0,
"data": {
"groupId": "7803717cf55d43d880542345cbe02f23",
"uid": 69,
"type": 0,
"groupName": "test123",
"desc": "群描述",
"avatar": "群头像的地址",
"capacity": 200,
"isAudit": 1,
"seq": 0,
"initSeq": 0,
"readSeq": 0,
"stickies": 0,
"isShield": 0
}
}
2.加入群组：
http post url：http://10.125.3.61:8080/app-server/group/joinGroup.json
请求参数示例：
{
"groupId": "9b82afcd6b564fa584eb59f2336d3839",
"uid": 73,
"nickName": "tom2"
}

返回参数示例：
{
"message": "等待管理员审核",
"code": 0,
"data": { }
}
3.审核群成员：
http post url：http://10.125.3.61:8080/app-server/group/auditMember.json
请求参数示例：
{
"groupId": "9b82afcd6b564fa584eb59f2336d3839",
"uid": 69,
"members": [
{
"uid": 73,
"userName": "tom2"
}
],
"status": 1
}

返回参数示例：
{
"message": "操作成功",
"code": 0,
"data": { }
}
4.邀请入群：
http post url：http://10.125.3.61:8080/app-server/group/inviteGroup.json
请求参数示例：
{
"groupId": "9b82afcd6b564fa584eb59f2336d3839",
"uid": 69,
"nickName": "tom1",
"members": [
{
"uid": 71,
"imUserId":3,
"userName": "tom1"
}
]
}

返回参数示例：
{
"message": "邀请成功",
"code": 0,
"data": { }
}

5.退出群组：
http post url：http://10.125.3.61:8080/app-server/group/quitGroup.json
请求参数示例：
{
"uid": 73,
"nickName": "tom2",
"groupId": "9b82afcd6b564fa584eb59f2336d3839"
}

返回参数示例：
{
"message": "操作成功",
"code": 0,
"data": {"groupId": "9b82afcd6b564fa584eb59f2336d3839"}
}
6.群组踢人：
http post url：http://10.125.3.61:8080/app-server/group/kickGroup.json
请求参数示例：
{
"uid": 69,
"nickName": "小李",
"members": [
{
"uid": 71,
"userName": "tom1"
}
],
"groupId": "3fdd174f99864fa19902ce0263443e13"
}

返回参数示例：
{
"message": "操作成功",
"code": 0,
"data": {"groupId": "9b82afcd6b564fa584eb59f2336d3839"}
}
7.修改群信息：
http post url：http://10.125.3.61:8080/app-server/group/editGroup.json
请求参数示例：
{
"uid": 69, //必要
"nickName": "小李", //必要
"groupId": "3fdd174f99864fa19902ce0263443e13", //必要
"groupName": "把群修改得试试",
"desc": "设置一下群的描述",
"avatar": "设置下群的头像",
"isAudit": 0,
"capacity": 200
}

返回参数示例：
{
"message": "修改成功",
"code": 0,
"data": {
"uid": 69,
"nickName": "小李",
"groupId": "3fdd174f99864fa19902ce0263443e13",
"groupName": "把群修改得试试",
"desc": "设置一下群的描述",
"avatar": "设置下群的头像",
"isAudit": 0,
"capacity": 200
}
}
8.修改备注：
http post url：http://10.125.3.61:8080/app-server/group/editMemberMark.json
请求参数示例：
{
"groupId": "3fdd174f99864fa19902ce0263443e13",
"uid": 69,
"nickName": "小李",
"markedUid": 71,
"mark": "tom3"
}

返回参数示例：
{
"message": "修改成功",
"code": 0,
"data": {"groupId": "3fdd174f99864fa19902ce0263443e13"}
}
9.获取群成员：
http post url：http://10.125.3.61:8080/app-server/group/listGroupMember.json
请求参数示例：
{
"groupId": "3fdd174f99864fa19902ce0263443e13",
"uid": 69
}

返回参数示例：
{
"message": "操作成功",
"code": 0,
"data": {
"groupId": "f3f91d4cea364af499c162b29c6e59fa",
"members": [
{
"uid": 69,
"nickName": "hello1",
"joinTime": 1457499688204
},
{
"uid": 3,
"nickName": "tom1",
"joinTime": 1457499688204
},
{
"uid": 4,
"nickName": "tom2",
"joinTime": 1457499688204
}
],
"memberMarks": [
{
"markedUid": 69,
"mark": "sss"
}
]
}
}
10.获取群列表：
http post url：http://10.125.3.61:8080/app-server/group/listGroup.json
请求参数示例：
{ "uid":69}
返回参数示例：
{
"message": "成功",
"code": 0,
"data": [
{
"groupId": "9b82afcd6b564fa584eb59f2336d3839",
"uid": 69,
"type": 2,
"groupName": "群组测试",
"desc": "群描述",
"avatar": "群头像的地址",
"capacity": 200,
"isAudit": 1,
"seq": 0,
"initSeq": 0,
"readSeq": 0,
"stickies": 0,
"isShield": 0
},
{
"groupId": "667cba717a79408aaca07603097e38f5",
"uid": 69,
"type": 2,
"groupName": "group1",
"desc": "",
"avatar": "群头像的地址",
"capacity": 200,
"isAudit": 1,
"seq": 0,
"initSeq": 0,
"readSeq": 0,
"stickies": 0,
"isShield": 0
},
{
"groupId": "3fdd174f99864fa19902ce0263443e13",
"uid": 69,
"type": 2,
"groupName": "把群修改得试试",
"desc": "设置一下群的描述",
"avatar": "设置下群的头像",
"capacity": 200,
"isAudit": 0,
"seq": 0,
"initSeq": 0,
"readSeq": 0,
"stickies": 0,
"isShield": 0
}
]
}
11.获取群组信息：
http post url：http://10.125.3.61:8080/app-server/group/getGroup.json
请求参数示例：
{
"groupId": "3fdd174f99864fa19902ce0263443e13",
"uid": 69
}
返回参数示例：
{
"message": "获取群组信息成功",
"code": 0,
"data": {
"groupId": "3fdd174f99864fa19902ce0263443e13",
"uid": 69,
"type": 2,
"groupName": "把群修改得试试",
"desc": "设置一下群的描述",
"avatar": "设置下群的头像",
"capacity": 200,
"isAudit": 0,
"seq": 0,
"initSeq": 0,
"readSeq": 0,
"stickies": 0,
"isShield": 0,
"members": [
{
"uid": 69,
"nickName": "小李",
"joinTime": 1456802850421
},
{
"uid": 71,
"nickName": "tom1",
"joinTime": 1456802850421
},
{
"uid": 73,
"nickName": "tom2",
"joinTime": 1456802850421
}
]
}
}
12.设置屏蔽群消息：
http post url：http://10.125.3.61:8080/app-server/group/shieldGroup.json
请求参数示例：
{
"groupId": "3fdd174f99864fa19902ce0263443e13",
"uid": 69,
"isShield": 1 //1:屏蔽群消息 0:不屏蔽群消息
}

返回参数示例：
{
"message": "设置成功",
"code": 0,
"data": { }
}
13.设置群置顶：
http post url：http://10.125.3.61:8080/app-server/group/sickiesGroup.json
请求参数示例：
{
"groupId": "3fdd174f99864fa19902ce0263443e13",
"uid": 69,
"stickies": 1 //1:群消息置顶 0:群消息不置顶
}

返回参数示例：
{
"message": "设置成功",
"code": 0,
"data": { }
}
14.解散群组
http post url：http://10.125.3.61:8080/app-server/group/disbandGroup.json
请求参数示例：
{
"groupId": "3fdd174f99864fa19902ce0263443e13",
"uid": 69
}

返回参数示例：
{
"message": "群组解散成功",
"code": 0,
"data":
{
"groupId": "3fdd174f99864fa19902ce0263443e13",
"uid": 69
}
}

三.好友操作接口说明
1.添加好友
http post url：http://10.125.3.61:8080/app-server/friend/addFriend.json
请求参数示例：
{
"uid": 71,
"nickName": "tom1",
"friendUid": 69
}

返回参数示例：
{
"message": "好友申请成功",
"code": 0,
"data": { }
}
2.好友审核
http post url：http://10.125.3.61:8080/app-server/friend/auditFriend.json
请求参数示例：
{
"uid": 69,
"friendUid": 71,
"status": 1 //0:不接受加好友请求 1：同意加为好友
}

返回参数示例：
{
"message": "审核成功",
"code": 0,
"data": { }
}
3.删除好友
http post url：http://10.125.3.61:8080/app-server/friend/delFriend.json
请求参数示例：
{
"uid": 71,
"friendUid": 69
}

返回参数示例：
{
"message": "删除成功",
"code": 0,
"data": { }
}
4.对好友备注
http post url：http://10.125.3.61:8080/app-server/friend/editMark.json
请求参数示例：
{
"uid": 71,
"friendUid": 69,
"mark": "nickName"
}

返回参数示例：
{
"message": "修改好友备注成功",
"code": 0,
"data": { }
}

5.获取好友列表
http post url：http://10.125.3.61:8080/app-server/friend/listFriend.json
请求参数示例：
{ "uid":71}

返回参数示例：
{
"message": "获取好友列表成功",
"code": 0,
"data": [
{
"friendUid": 69,
"friendNickName": "friendNickName",
"mark": "213123123",
"status": 1
}
]
}
四.sdk接口
1.sdk获取token接口：
signature参数值为：appId+imUserId+timestamp顺序组成的字符串进行MD5签名的32位签名串

http get url：http://10.125.3.61:8080/im-platform/token/getToken.json?appId=TEST_APP_ID&imUserId=1&timestamp=1458284276718&signature=0700ead019c5e37399cad8eac771310c

返回参数示例：
{
"message": "操作成功",
"code": 0,
"data":
{
"appId": "appId",
"imUserId": 1,
"token": "token",
"tokenExpires": 1459525393556
}
}

2.sdk获取服务器地址列表接口：
http get url：http://10.125.3.61:8080/im-platform/address/getIMAddress.json?appId=TEST_APP_ID&imUserId=1&token=43a7634f61ed48198037b36032ad0740
返回参数示例：
{
"message": "服务器列表获取成功",
"code": 0,
"data": {
"fileServerList": [
"10.125.3.61:8080/im-upload/"
],
"imServerList": [
"10.125.3.21:9000"
],
"time": 1458899849459
}
}
五.朋友圈接口
1.发表朋友圈说说
http post url：http://10.125.3.61:8080/app-server/friendGroup/addFriendGroup.json
请求参数示例：
{
"uid": 69,
"nickName": "tom",
"contentType":1, //1:txt 2:image 3:video
"content": "小李",
"extra": "http://localhost:8080"
}
返回参数示例：
{
"message": "添加成功",
"code": 0,
"data": {}
}

2.删除朋友圈说说
http post url：http://10.125.3.61:8080/app-server/friendGroup/delFriendGroup.json
请求参数示例：
{
"id":1,
"uid": 69
}
返回参数示例：
{
"message": "删除成功",
"code": 0,
"data": {
"id": 1,
"uid": 309
}
}

3.查看个人自己发布过的说说历史
http post url：http://10.125.3.61:8080/app-server/friendGroup/personalFriendGroup.json
请求参数示例：
{
"uid": 69
}
返回参数示例：
{
"message": "成功",
"code": 0,
"data": [
{
"id": 1,
"uid": 309,
"nickName": "Sanders9",
"content": "小李今天心情很差",
"extra": "http://localhost:8080",
"contentType": 1,
"createTime": 1461896523627,
"updateTime": 1461896523627
}
]
}

4.查看所有好友发布过的朋友圈
http post url：http://10.125.3.61:8080/app-server/friendGroup/listFriendGroup.json
请求参数示例：
{
"uid": 69,
"beforeDay": 1, //查看前几天发布的内容 1,2,3....天前
"endTime":1458899849459 //查看结束时间 (上次拉取返回的最后一条朋友圈创建时间，没有就是0)
}
返回参数示例：
{
"message": "成功",
"code": 0,
"data": [
{
"id": 7,
"uid": 423,
"nickName": "hee",
"content": "hee现在心情很惆怅！",
"extra": "http://localhost:8080",
"contentType": 1,
"createTime": 1461897171218,
"updateTime": 1461897171218
},
{
"id": 5,
"uid": 309,
"nickName": "Sanders9",
"content": "小李现在心情好多了！",
"extra": "http://localhost:8080",
"contentType": 1,
"createTime": 1461897130020,
"updateTime": 1461897130020
},
{
"id": 3,
"uid": 423,
"nickName": "hee",
"content": "hee今天心情很开心",
"extra": "http://localhost:8080",
"contentType": 1,
"createTime": 1461896811946,
"updateTime": 1461896811946
},
{
"id": 1,
"uid": 309,
"nickName": "Sanders9",
"content": "小李今天心情很差",
"extra": "http://localhost:8080",
"contentType": 1,
"createTime": 1461896523627,
"updateTime": 1461896523627
}
]
}

