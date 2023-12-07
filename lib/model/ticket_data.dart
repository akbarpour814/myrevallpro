//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/model
import '/model/date_time_format.dart';

class TicketData {
  late Topic topic;
  late String text;
  late TicketStatus status;
  late List<String> answers;
  late String sentDate;
  late String lastAnswerDate;

  TicketData.fromJson(Map<String, dynamic> json) {
    int findTopic = TopicExtension.topics.values
        .toList()
        .indexWhere((element) => element == json['title']);

    topic = TopicExtension.topics.keys.elementAt(
        findTopic > -1 ? findTopic : TopicExtension.topics.length - 1);
    text = json['body'];
    status =
        json['status'] == 'done' ? TicketStatus.answered : TicketStatus.waiting;

    answers = [];
    for (Map<String, dynamic> answer in json['answers']) {
      answers.add(answer['body']);
    }

    sentDate = DateTimeFormat.dateTimeFormat(date: json['created_at']);

    lastAnswerDate = DateTimeFormat.dateTimeFormat(date: json['updated_at']);
  }
}

enum Topic {
  suggestion,
  complaint,
  defect,
  unsuccessfulPayment,
  question,
  other,
}

extension TopicExtension on Topic {
  static const Map<Topic, String> topics = {
    Topic.suggestion: 'پیشنهاد',
    Topic.complaint: 'شکایت',
    Topic.defect: 'گزارش نقص فنی',
    Topic.unsuccessfulPayment: 'خرید ناموفق',
    Topic.question: 'پرسش',
    Topic.other: 'سایر موارد',
  };

  String? get title => topics[this];
}

enum TicketStatus {
  answered,
  waiting,
  cancelled,
}

extension TicketStatusExtension on TicketStatus {
  static const Map<TicketStatus, String> statusOfTickets = {
    TicketStatus.answered: 'پاسخ داده شده',
    TicketStatus.waiting: 'در انتظار پاسخ',
    TicketStatus.cancelled: 'لغو ارسال',
  };

  static const Map<TicketStatus, Color> statusColorOfTickets = {
    TicketStatus.answered: Colors.lightGreen,
    TicketStatus.waiting: Colors.grey,
    TicketStatus.cancelled: Colors.redAccent,
  };

  String? get title => statusOfTickets[this];

  Color? get color => statusColorOfTickets[this];
}
