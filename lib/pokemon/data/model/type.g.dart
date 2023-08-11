// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TypeModelSchema = Schema(
  name: r'TypeModel',
  id: 6961925639635077432,
  properties: {
    r'slot': PropertySchema(
      id: 0,
      name: r'slot',
      type: IsarType.long,
    )
  },
  estimateSize: _typeModelEstimateSize,
  serialize: _typeModelSerialize,
  deserialize: _typeModelDeserialize,
  deserializeProp: _typeModelDeserializeProp,
);

int _typeModelEstimateSize(
  TypeModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _typeModelSerialize(
  TypeModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.slot);
}

TypeModel _typeModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TypeModel(
    slot: reader.readLongOrNull(offsets[0]),
  );
  return object;
}

P _typeModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TypeModelQueryFilter
    on QueryBuilder<TypeModel, TypeModel, QFilterCondition> {
  QueryBuilder<TypeModel, TypeModel, QAfterFilterCondition> slotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<TypeModel, TypeModel, QAfterFilterCondition> slotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<TypeModel, TypeModel, QAfterFilterCondition> slotEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<TypeModel, TypeModel, QAfterFilterCondition> slotGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<TypeModel, TypeModel, QAfterFilterCondition> slotLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<TypeModel, TypeModel, QAfterFilterCondition> slotBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TypeModelQueryObject
    on QueryBuilder<TypeModel, TypeModel, QFilterCondition> {}
