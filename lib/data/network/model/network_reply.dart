part 'network_reply.g.dart';

@immutable
@JsonSerializable()
class NetworkReply {
  final List<NetworkArticle> results;

  NetworkReply(
      this.results,
      );

  static const fromJsonFactory = _$NetworkReplyFromJson;

  factory NetworkReply.fromJson(Map<String, dynamic> json) => _$NetworkReplyFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkReplyToJson(this);
}
