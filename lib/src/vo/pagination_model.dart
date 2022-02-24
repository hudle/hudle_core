
import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable()
class Pagination {

  @JsonKey(name : "count")
  int count;
  @JsonKey(name : "current_page")
  int currentPage;
  @JsonKey(name : "per_page")
  int perPage;
  @JsonKey(name : "total")
  int total;
  @JsonKey(name : "total_pages")
  int totalPages;

  Pagination(
  {
    this.count = 0, this.currentPage = 0, this.perPage = 0, this.total = 0, this.totalPages = 0
});

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}


@JsonSerializable()
class Meta {

  @JsonKey(name : "pagination")
  final Pagination? pagination;
  @JsonKey(name: "is_valid")
  bool? isValid;
  @JsonKey(name: "first_unread_message_id")
  String? firstUnreadMessageId;
  @JsonKey(name: "extra")
  Map<String, dynamic>? extra;

  Meta(this.pagination);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}


@Deprecated("Use PaginationWrapper instead, only pass generic type model T, do not use List<T>")
class PaginationDataWrapper<T> {
  final T? data;
  final Meta? meta;

  PaginationDataWrapper(this.data, this.meta);
}

class PaginationWrapper<T> {
  final List<T>? data;
  final Meta? meta;

  PaginationWrapper(this.data, this.meta);
}



