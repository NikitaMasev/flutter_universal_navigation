import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'event_union.freezed.dart';

@freezed
abstract class EventUnion with _$EventUnion {
  const factory EventUnion() = Empty;
  const factory EventUnion.login({String data}) = Login;
}