// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return Pagination(
    count: json['count'] as int,
    currentPage: json['current_page'] as int,
    perPage: json['per_page'] as int,
    total: json['total'] as int,
    totalPages: json['total_pages'] as int,
  );
}

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'count': instance.count,
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    json['pagination'] == null
        ? null
        : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
  )
    ..isValid = json['is_valid'] as bool?
    ..firstUnreadMessageId = json['first_unread_message_id'] as String?
    ..extra = json['extra'] as Map<String, dynamic>?;
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'pagination': instance.pagination,
      'is_valid': instance.isValid,
      'first_unread_message_id': instance.firstUnreadMessageId,
      'extra': instance.extra,
    };
