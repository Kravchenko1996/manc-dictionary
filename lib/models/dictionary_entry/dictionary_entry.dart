import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_entry.freezed.dart';
part 'dictionary_entry.g.dart';

@freezed
abstract class DictionaryEntry with _$DictionaryEntry {
  const factory DictionaryEntry({
    @JsonKey(name: 'phrase') required String phrase,
    @JsonKey(name: 'definition') required String definition,
    @JsonKey(name: 'example') String? example,
  }) = _DictionaryEntry;

  factory DictionaryEntry.fromJson(Map<String, dynamic> json) => _$DictionaryEntryFromJson(json);
}