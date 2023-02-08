import 'dart:async';

import '../core.dart';

abstract class Repository<T extends Entity> {
  T? get(String id);

  bool put(T entity);

  bool remove(T entity);

  Stream<StreamObjectChange<T>> get streamOnChange;
}

class MemoryRepository<T extends Entity> extends Repository<T> {
  final Map<String, T> _cache = {};

  MemoryRepository() {
    streamOnChange.listen((event) {
      if (event.changeType == StreamObjectChangeType.put) {
        _cache[event.object.id] = event.object;
      } else if (event.changeType == StreamObjectChangeType.remove) {
        _cache.remove(event.object.id);
      }
    });
  }

  @override
  T? get(String id) {
    return _cache[id];
  }

  @override
  bool put(T entity) {
    _streamControllerOnChange.sink.add(StreamObjectChange.put(entity));
    return true;
  }

  @override
  bool remove(T entity) {
    _streamControllerOnChange.sink.add(StreamObjectChange.remove(entity));
    return true;
  }

  final StreamController<StreamObjectChange<T>> _streamControllerOnChange = StreamController();

  @override
  Stream<StreamObjectChange<T>> get streamOnChange => _streamControllerOnChange.stream;
}
