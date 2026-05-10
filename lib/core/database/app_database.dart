import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class CachedSongs extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get artist => text().nullable()();
  TextColumn get artistId => text().nullable()();
  TextColumn get album => text().nullable()();
  TextColumn get albumId => text().nullable()();
  TextColumn get coverArt => text().nullable()();
  IntColumn get duration => integer().nullable()();
  IntColumn get track => integer().nullable()();
  IntColumn get year => integer().nullable()();
  TextColumn get genre => text().nullable()();
  TextColumn get contentType => text().nullable()();
  TextColumn get suffix => text().nullable()();
  IntColumn get size => integer().nullable()();
  IntColumn get bitRate => integer().nullable()();
  BoolColumn get starred => boolean().withDefault(const Constant(false))();
  IntColumn get cachedAt => integer()();
  IntColumn get lastAccessedAt => integer()();
  TextColumn get filePath => text()();
  BoolColumn get isDownload => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [CachedSongs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ─── Insert / Update ─────────────────────────────────────────────────

  Future<void> insertOrUpdate(CachedSongsCompanion entry) =>
      into(cachedSongs).insertOnConflictUpdate(entry);

  // ─── Queries ─────────────────────────────────────────────────────────

  Future<List<CachedSong>> getAll() =>
      (select(cachedSongs)..orderBy([(t) => OrderingTerm.desc(t.lastAccessedAt)]))
          .get();

  Stream<List<CachedSong>> watchAll() =>
      (select(cachedSongs)..orderBy([(t) => OrderingTerm.desc(t.lastAccessedAt)]))
          .watch();

  Future<CachedSong?> getById(String id) =>
      (select(cachedSongs)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<bool> exists(String id) async =>
      await getById(id) != null;

  Future<int> totalCacheSize() {
    final sum = cachedSongs.size.sum();
    final query = selectOnly(cachedSongs)..addColumns([sum]);
    return query.map((row) => row.read(sum) ?? 0).getSingle();
  }

  Future<List<CachedSong>> oldestForEviction(int limit) =>
      (select(cachedSongs)
            ..orderBy([(t) => OrderingTerm.asc(t.lastAccessedAt)])
            ..limit(limit))
          .get();

  // ─── Delete ──────────────────────────────────────────────────────────

  Future<void> deleteById(String id) =>
      (delete(cachedSongs)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(cachedSongs).go();

  // ─── Update ──────────────────────────────────────────────────────────

  Future<void> updateLastAccessed(String id) =>
      (update(cachedSongs)..where((t) => t.id.equals(id))).write(
        CachedSongsCompanion(lastAccessedAt: Value(DateTime.now().millisecondsSinceEpoch)),
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final db = driftDatabase(name: 'umsic_cache');
    return db;
  });
}
