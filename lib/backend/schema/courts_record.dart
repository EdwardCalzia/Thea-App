import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'courts_record.g.dart';

abstract class CourtsRecord
    implements Built<CourtsRecord, CourtsRecordBuilder> {
  static Serializer<CourtsRecord> get serializer => _$courtsRecordSerializer;

  @nullable
  String get name;

  @nullable
  LatLng get location;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  DocumentReference get user;

  @nullable
  String get description;

  @nullable
  int get likes;

  @nullable
  double get value;

  @nullable
  @BuiltValueField(wireName: 'image_url')
  String get imageUrl;

  @nullable
  @BuiltValueField(wireName: 'is_indoor')
  bool get isIndoor;

  @nullable
  @BuiltValueField(wireName: 'video_url')
  String get videoUrl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CourtsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..likes = 0
    ..value = 0.0
    ..imageUrl = ''
    ..isIndoor = false
    ..videoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courts');

  static Stream<CourtsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CourtsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static CourtsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CourtsRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..location = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..description = snapshot.data['description']
          ..likes = snapshot.data['likes']
          ..value = snapshot.data['value']
          ..imageUrl = snapshot.data['image_url']
          ..isIndoor = snapshot.data['is_indoor']
          ..videoUrl = snapshot.data['video_url']
          ..reference = CourtsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CourtsRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'courts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CourtsRecord._();
  factory CourtsRecord([void Function(CourtsRecordBuilder) updates]) =
      _$CourtsRecord;

  static CourtsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCourtsRecordData({
  String name,
  LatLng location,
  DateTime createdAt,
  DocumentReference user,
  String description,
  int likes,
  double value,
  String imageUrl,
  bool isIndoor,
  String videoUrl,
}) =>
    serializers.toFirestore(
        CourtsRecord.serializer,
        CourtsRecord((c) => c
          ..name = name
          ..location = location
          ..createdAt = createdAt
          ..user = user
          ..description = description
          ..likes = likes
          ..value = value
          ..imageUrl = imageUrl
          ..isIndoor = isIndoor
          ..videoUrl = videoUrl));
