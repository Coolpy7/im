import 'dart:io';

import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';

// declare db object
ObjectDB db_chat;

class chat_database {
  chat_database._internal();

  static chat_database _singleton = new chat_database._internal();

  factory chat_database()=> _singleton;

  Future<bool> create_db() async {
    // get document directory using path_provider plugin
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dbFilePath = [appDocDir.path,  'chat.db'].join('/');
    // delete old database file if exists
    File dbFile = File(dbFilePath);
    // check if database already exists
    var isNew = !await dbFile.exists();

    // initialize and open database
    db_chat = ObjectDB(dbFilePath);
    db_chat.open();
    if (isNew) {
      db_chat.insertMany([
        {
          'avatar': 'assets/images/ic_file_transfer.png',
          'title': '文件传输助手',
          'desc': '',
          'updateAt': '19:56',
          'type': 1,
        },
        {
          'avatar': 'assets/images/ic_tx_news.png',
          'title': '腾讯新闻',
          'desc': '豪车与出租车刮擦 俩车主划拳定责',
          'updateAt': '17:20',
          'type':2,
        },
        {
          'avatar': 'assets/images/ic_wx_games.png',
          'title': '微信游戏',
          'titleColor': 0xff586b95,
          'desc': '25元现金助力开学季！',
          'updateAt': '17:12',
          'type':3,
        },
        {
          'avatar': 'https://randomuser.me/api/portraits/men/10.jpg',
          'title': '汤姆丁',
          'desc': '今晚要一起去吃肯德基吗？',
          'updateAt': '17:56',
          'isMute': true,
          'unreadMsgCount': 0,
          'type':0,
        },
        {
          'avatar': 'https://randomuser.me/api/portraits/women/10.jpg',
          'title': 'Tina Morgan',
          'desc': '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
          'updateAt': '17:58',
          'isMute': false,
          'unreadMsgCount': 3,
          'type':0,
        },
        {
          'avatar': 'assets/images/ic_fengchao.png',
          'title': '蜂巢智能柜',
          'titleColor': 0xff586b95,
          'desc': '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
          'updateAt': '17:12',
          'type':4,
        },
        {
          'avatar': 'https://randomuser.me/api/portraits/women/57.jpg',
          'title': 'Lily',
          'desc': '今天要去运动场锻炼吗？',
          'updateAt': '昨天',
          'isMute': false,
          'unreadMsgCount': 99,
          'type':0,
        },
        {
          'avatar': 'https://randomuser.me/api/portraits/men/10.jpg',
          'title': '汤姆丁',
          'desc': '今晚要一起去吃肯德基吗？',
          'updateAt': '17:56',
          'isMute': true,
          'unreadMsgCount': 0,
          'type':0,
        },
        {
          'avatar': 'https://randomuser.me/api/portraits/women/10.jpg',
          'title': 'Tina Morgan',
          'desc': '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
          'updateAt': '17:58',
          'isMute': false,
          'unreadMsgCount': 3,
          'type':0,
        },
        {
          'avatar': 'https://randomuser.me/api/portraits/women/57.jpg',
          'title': 'Lily',
          'desc': '今天要去运动场锻炼吗？',
          'updateAt': '昨天',
          'isMute': false,
          'unreadMsgCount': 0,
          'type':0,
        },
        {
          'avatar': 'https://randomuser.me/api/portraits/men/10.jpg',
          'title': '汤姆丁',
          'desc': '今晚要一起去吃肯德基吗？',
          'updateAt': '17:56',
          'isMute': true,
          'unreadMsgCount': 0,
          'type':0,
        },
        {
          'avatar': 'https://randomuser.me/api/portraits/women/10.jpg',
          'title': 'Tina Morgan',
          'desc': '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
          'updateAt': '17:58',
          'isMute': false,
          'unreadMsgCount': 1,
          'type':0,
        },
        {
          'avatar': 'https://randomuser.me/api/portraits/women/57.jpg',
          'title': 'Lily',
          'desc': '今天要去运动场锻炼吗？',
          'updateAt': '昨天',
          'isMute': false,
          'unreadMsgCount': 0,
          'type':0,
        },
      ]);
      print("init chat database");
    }
  }

  Future<List<Map<dynamic, dynamic>>> getall() async {
    var result = await db_chat.find({'active': true, 'name.first': 'Some'});
    return result;
  }

}

var chatdb = new chat_database();