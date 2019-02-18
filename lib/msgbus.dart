import 'package:event_bus/event_bus.dart';

final EventBus eventBus = new EventBus();

class LoginEvent {
  String text;

  LoginEvent(this.text);
}