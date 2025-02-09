// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:topshop/domain/order/entities/order_progress_entity.dart';

class OrderProgressModel {
  final String title;
  final bool done;
  OrderProgressModel({
    required this.title,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'done': done,
    };
  }

  factory OrderProgressModel.fromMap(Map<String, dynamic> map) {
    return OrderProgressModel(
      title: map['title'] as String,
      done: map['done'] as bool,
    );
  }
}

extension OrderProgressXEntity on OrderProgressModel {
  OrderProgressEntity toEntity() =>
      OrderProgressEntity(title: title, done: done);
}

extension OrderProgressXModel on OrderProgressEntity {
  OrderProgressModel toModel() => OrderProgressModel(title: title, done: done);
}
