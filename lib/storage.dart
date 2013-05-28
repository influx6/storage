library Storage;

import 'dart:mirrors';

part 'storage_abstract.dart';

class MapStorage<K,V> extends _Storage3D<Map,K,V>{

    var store;

    MapStorage(String id) : super._init(id) {
        this.store = new Map<K,V>();
    }

    MapStorage.from(String id,Map p) : super._init(id) {
      this.store = new Map<K,V>.from(p);
    }
    
    V get(K n){
      return store[n];
    }

    V delete(K n){
      return this.store.remove(n);
    }
    
    void set(K n, V val){
      if(this.store.containsKey(n)) return;
      this.store[n] = val;
    }
    
    bool exists(K n){
      if(this.store.containsKey(n)) return true;
      return false;
    }
    
    Iterable values(){ return this.store.values.toList(); }
    Iterable keys(){ return this.store.keys.toList(); }
    int size(){ return this.store.length; }
    bool isEmpty(){ return this.store.isEmpty; }
}

