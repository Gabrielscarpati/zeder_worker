import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/core.dart';

void main() {
  test('MemoryRepository.constructor: deve criar um objeto com o cache vazio', () {
    MemoryRepository repository = MemoryRepository();
    expect(repository.cache.isEmpty, true);
  });

  test('MemoryRepository.put: deve colocar o objeto passado no parametro no cache de forma assincrona', () async {
    MemoryRepository repository = MemoryRepository();
    var entity = FakeEntity(id: '1');
    repository.put(entity);
    expect(repository.cache.length, 0);
    await Future.delayed(const Duration(milliseconds: 200), () {
      expect(repository.cache.length, 1);
    });
    repository.dispose();
  });

  test('MemoryRepository.remove: deve remover o objeto passado no parametro no cache de forma assincrona', () async {
    MemoryRepository repository = MemoryRepository();
    var entity = FakeEntity(id: '1');
    repository.put(entity);
    expect(repository.cache.length, 0);
    await Future.delayed(const Duration(milliseconds: 200), () {
      expect(repository.cache.length, 1);
    });

    repository.remove(entity);
    expect(repository.cache.length, 1);
    await Future.delayed(const Duration(milliseconds: 200), () {
      expect(repository.cache.length, 0);
    });
    repository.dispose();
  });

  test('MemoryRepository.get: deve obter o objeto passado no parametro do cache de forma assincrona', () async {
    MemoryRepository repository = MemoryRepository();
    var entity = FakeEntity(id: '1');
    repository.put(entity);
    expect(repository.cache.length, 0);
    await Future.delayed(const Duration(milliseconds: 200), () {
      expect(repository.cache.length, 1);
    });

    var entity2 = await repository.get(entity.id);
    expect(entity2 != null, true);
    repository.dispose();
  });

  test('MemoryRepository.put: deve obter o objeto passado no parametro do cache de forma assincrona', () async {
    MemoryRepository repository = MemoryRepository();
    var entity = FakeEntity(id: '1');
    repository.put(entity);
    expect(repository.cache.length, 0);
    await Future.delayed(const Duration(milliseconds: 200), () {
      expect(repository.cache.length, 1);
    });

    var entity2 = await repository.get(entity.id);
    expect(entity2 != null, true);
    repository.dispose();
  });
}

class FakeEntity extends Entity {
  FakeEntity({required String id}) : super(id: id);

  @override
  Map<String, dynamic> toJson() {
    return {"id": id};
  }
}
