import 'package:catography/data/network/model/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_reply.g.dart';

@immutable
@JsonSerializable()
class NetworkReply {
  final List<NetworkCatImage> results;

  NetworkReply(
      this.results,
      );

  static const fromJsonFactory = _$NetworkReplyFromJson;

  factory NetworkReply.fromJson(Map<String, dynamic> json) => _$NetworkReplyFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkReplyToJson(this);
}
