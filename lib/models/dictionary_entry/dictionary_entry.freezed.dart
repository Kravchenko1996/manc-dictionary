// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DictionaryEntry {
  @JsonKey(name: 'phrase')
  String get phrase;
  @JsonKey(name: 'definition')
  String get definition;
  @JsonKey(name: 'example')
  String? get example;

  /// Create a copy of DictionaryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DictionaryEntryCopyWith<DictionaryEntry> get copyWith =>
      _$DictionaryEntryCopyWithImpl<DictionaryEntry>(
          this as DictionaryEntry, _$identity);

  /// Serializes this DictionaryEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DictionaryEntry &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.example, example) || other.example == example));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phrase, definition, example);

  @override
  String toString() {
    return 'DictionaryEntry(phrase: $phrase, definition: $definition, example: $example)';
  }
}

/// @nodoc
abstract mixin class $DictionaryEntryCopyWith<$Res> {
  factory $DictionaryEntryCopyWith(
          DictionaryEntry value, $Res Function(DictionaryEntry) _then) =
      _$DictionaryEntryCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'phrase') String phrase,
      @JsonKey(name: 'definition') String definition,
      @JsonKey(name: 'example') String? example});
}

/// @nodoc
class _$DictionaryEntryCopyWithImpl<$Res>
    implements $DictionaryEntryCopyWith<$Res> {
  _$DictionaryEntryCopyWithImpl(this._self, this._then);

  final DictionaryEntry _self;
  final $Res Function(DictionaryEntry) _then;

  /// Create a copy of DictionaryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phrase = null,
    Object? definition = null,
    Object? example = freezed,
  }) {
    return _then(_self.copyWith(
      phrase: null == phrase
          ? _self.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      definition: null == definition
          ? _self.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      example: freezed == example
          ? _self.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DictionaryEntry].
extension DictionaryEntryPatterns on DictionaryEntry {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DictionaryEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntry() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DictionaryEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntry():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DictionaryEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntry() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'phrase') String phrase,
            @JsonKey(name: 'definition') String definition,
            @JsonKey(name: 'example') String? example)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntry() when $default != null:
        return $default(_that.phrase, _that.definition, _that.example);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'phrase') String phrase,
            @JsonKey(name: 'definition') String definition,
            @JsonKey(name: 'example') String? example)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntry():
        return $default(_that.phrase, _that.definition, _that.example);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'phrase') String phrase,
            @JsonKey(name: 'definition') String definition,
            @JsonKey(name: 'example') String? example)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntry() when $default != null:
        return $default(_that.phrase, _that.definition, _that.example);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DictionaryEntry implements DictionaryEntry {
  const _DictionaryEntry(
      {@JsonKey(name: 'phrase') required this.phrase,
      @JsonKey(name: 'definition') required this.definition,
      @JsonKey(name: 'example') this.example});
  factory _DictionaryEntry.fromJson(Map<String, dynamic> json) =>
      _$DictionaryEntryFromJson(json);

  @override
  @JsonKey(name: 'phrase')
  final String phrase;
  @override
  @JsonKey(name: 'definition')
  final String definition;
  @override
  @JsonKey(name: 'example')
  final String? example;

  /// Create a copy of DictionaryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DictionaryEntryCopyWith<_DictionaryEntry> get copyWith =>
      __$DictionaryEntryCopyWithImpl<_DictionaryEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DictionaryEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DictionaryEntry &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.example, example) || other.example == example));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phrase, definition, example);

  @override
  String toString() {
    return 'DictionaryEntry(phrase: $phrase, definition: $definition, example: $example)';
  }
}

/// @nodoc
abstract mixin class _$DictionaryEntryCopyWith<$Res>
    implements $DictionaryEntryCopyWith<$Res> {
  factory _$DictionaryEntryCopyWith(
          _DictionaryEntry value, $Res Function(_DictionaryEntry) _then) =
      __$DictionaryEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'phrase') String phrase,
      @JsonKey(name: 'definition') String definition,
      @JsonKey(name: 'example') String? example});
}

/// @nodoc
class __$DictionaryEntryCopyWithImpl<$Res>
    implements _$DictionaryEntryCopyWith<$Res> {
  __$DictionaryEntryCopyWithImpl(this._self, this._then);

  final _DictionaryEntry _self;
  final $Res Function(_DictionaryEntry) _then;

  /// Create a copy of DictionaryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phrase = null,
    Object? definition = null,
    Object? example = freezed,
  }) {
    return _then(_DictionaryEntry(
      phrase: null == phrase
          ? _self.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      definition: null == definition
          ? _self.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      example: freezed == example
          ? _self.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
