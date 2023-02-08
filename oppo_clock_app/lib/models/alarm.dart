class Alarm {
  final String id;
   String name;
   int minute;
   int seconds;
   bool isVibrate;
   bool isSnooze;
  bool isActive;

  Alarm(
      {required this.id,
      required this.name,
      required this.minute,
      required this.seconds,
      required this.isVibrate,
      required this.isSnooze,
      required this.isActive}
    );
}


List<Alarm> items = [
    Alarm(id: "1", name: "Sınav Var", minute: 06, seconds: 44, isVibrate: true, isSnooze: true, isActive: false),
    Alarm(id: "2", name: "", minute: 07, seconds: 41, isVibrate: false, isSnooze: true, isActive: true),
    Alarm(id: "3", name: "", minute: 14, seconds: 40, isVibrate: true, isSnooze: true, isActive: false),
    Alarm(id: "4", name: "Maç Var", minute: 06, seconds: 44, isVibrate: true, isSnooze: true, isActive: true),
  ];