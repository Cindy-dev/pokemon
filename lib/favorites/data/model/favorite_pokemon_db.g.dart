// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_pokemon_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavoritePokemonDBCollection on Isar {
  IsarCollection<FavoritePokemonDB> get favoritePokemonDBs => this.collection();
}

const FavoritePokemonDBSchema = CollectionSchema(
  name: r'FavoritePokemonDB',
  id: -4728903845232791916,
  properties: {},
  estimateSize: _favoritePokemonDBEstimateSize,
  serialize: _favoritePokemonDBSerialize,
  deserialize: _favoritePokemonDBDeserialize,
  deserializeProp: _favoritePokemonDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _favoritePokemonDBGetId,
  getLinks: _favoritePokemonDBGetLinks,
  attach: _favoritePokemonDBAttach,
  version: '3.1.0+1',
);

int _favoritePokemonDBEstimateSize(
  FavoritePokemonDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _favoritePokemonDBSerialize(
  FavoritePokemonDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
FavoritePokemonDB _favoritePokemonDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavoritePokemonDB();
  object.id = id;
  return object;
}

P _favoritePokemonDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favoritePokemonDBGetId(FavoritePokemonDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _favoritePokemonDBGetLinks(
    FavoritePokemonDB object) {
  return [];
}

void _favoritePokemonDBAttach(
    IsarCollection<dynamic> col, Id id, FavoritePokemonDB object) {
  object.id = id;
}

extension FavoritePokemonDBQueryWhereSort
    on QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QWhere> {
  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FavoritePokemonDBQueryWhere
    on QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QWhereClause> {
  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavoritePokemonDBQueryFilter
    on QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QFilterCondition> {
  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavoritePokemonDBQueryObject
    on QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QFilterCondition> {}

extension FavoritePokemonDBQueryLinks
    on QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QFilterCondition> {}

extension FavoritePokemonDBQuerySortBy
    on QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QSortBy> {}

extension FavoritePokemonDBQuerySortThenBy
    on QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QSortThenBy> {
  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension FavoritePokemonDBQueryWhereDistinct
    on QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QDistinct> {}

extension FavoritePokemonDBQueryProperty
    on QueryBuilder<FavoritePokemonDB, FavoritePokemonDB, QQueryProperty> {
  QueryBuilder<FavoritePokemonDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
