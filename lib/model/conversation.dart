import 'dart:convert';

import 'package:flutter/material.dart';
import '../constants.dart';

enum Device {
  MAC,
  WIN
}

class Conversation {
  const Conversation({
    @required this.avatar,
    @required this.title,
    @required this.type,
    this.titleColor: AppColors.TitleColor,
    this.desc,
    @required this.updateAt,
    this.isMute: false,
    this.unreadMsgCount: 0,
    this.dispalyDot: false
  }): assert(avatar != null),
      assert(title != null),
      assert(type != null),
      assert(updateAt != null);

  final String avatar;
  final String title;
  final int titleColor;
  final String desc;
  final String updateAt;
  final bool isMute;
  final int unreadMsgCount;
  final bool dispalyDot;
  final int type;
  
  bool isAvatarFromNet() {
    if (this.avatar.indexOf('http') == 0 || this.avatar.indexOf('https') == 0) {
      return true;
    }
    return false;
  }

  Conversation clientFromJson(String str) {
    final jsonData = json.decode(str);
    return Conversation.fromJson(jsonData);
  }

  String clientToJson(Conversation data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }

  factory Conversation.fromJson(Map<String, dynamic> json) => new Conversation(
    avatar: json["avatar"],
    title: json["title"],
    titleColor: json["titleColor"],
    desc: json["desc"],
    updateAt: json["updateAt"],
    isMute: json["isMute"],
    unreadMsgCount: json["unreadMsgCount"],
    dispalyDot: json["dispalyDot"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "title": title,
    "titleColor": titleColor,
    "desc": desc,
    "updateAt": updateAt,
    "isMute": isMute,
    "unreadMsgCount": unreadMsgCount,
    "dispalyDot": dispalyDot,
    "type": type,
  };
}

class ConversationPageData {
  const ConversationPageData({
    this.device,
    this.conversations,
  });

  final Device device;
  final List<Conversation> conversations;

  static mock() {
    return ConversationPageData(device: Device.WIN, conversations: mockConversations);
  }

  static List<Conversation> mockConversations = [
  const Conversation(
      avatar: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      desc: '',
      updateAt: '19:56',
      type:1,
    ),
    const Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      desc: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '17:20',
      type:2,
    ),
    const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      desc: '25元现金助力开学季！',
      updateAt: '17:12',
      type:3,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
      type:0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 3,
      type:0,
    ),
    const Conversation(
      avatar: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      desc: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      updateAt: '17:12',
      type:4,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 99,
      type:0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
      type:0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 3,
      type:0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
      type:0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
      type:0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 1,
      type:0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
      type:0,
    ),
];
}