import 'dart:convert';
import 'package:mqtt_client/mqtt_client.dart';

final MqttClient client = new MqttClient('192.168.190.167', '');

class MqttLogin {
  MqttLogin._internal();
  static MqttLogin _singleton = new MqttLogin._internal();
  factory MqttLogin()=> _singleton;

  Future<bool> login(cid, user, pass) async {
    client.port = 1883;
    client.logging(on: false);
    client.keepAlivePeriod = 3600;
    client.setProtocolV311();

    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;

    final MqttConnectMessage connMess = MqttConnectMessage().withClientIdentifier(cid).keepAliveFor(3600);
    client.connectionMessage = connMess;

    try {
      await client.connect(user, pass);
      client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage recMess = c[0].payload;
        //final String pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        //var encoded = utf8.encode('中文');
        var decoded = utf8.decode(recMess.payload.message);
        print(decoded);
      });
      return true;
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      client.disconnect();
      return false;
    }
  }

  Future<bool> state() async {
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      return true;
    } else {
      client.disconnect();
      return false;
    }
  }

  Future<void> sub(topic) async {
    client.subscribe(topic, MqttQos.atMostOnce);
  }

  Future<void> unsub(topic) async {
    client.unsubscribe(topic);
  }

  Future<void> disconnect() async {
    client.disconnect();
  }

  Future<void> pub(topic, payload) async {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(payload);
    client.publishMessage(topic, MqttQos.atMostOnce, builder.payload);
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus.returnCode == MqttConnectReturnCode.solicited) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }
  }

  /// The successful connect callback
  void onConnected() {
    print('EXAMPLE::OnConnected client callback - Client connection was sucessful');
  }
}

//定义一个top-level变量，页面引入该文件后可以直接使用bus
var chater = new MqttLogin();