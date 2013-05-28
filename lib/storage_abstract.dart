part of Storage;

abstract class Methodable{

    void callDynamically(Invocation m);
    void noSuchMethod(Invocation mr){
      this.callDynamically(mr);
    }
}

abstract class _Storage3D<T,K,V> extends Methodable{
    final String id;
    T store;

    _Storage3D._init(this.id);
    
    @override
    V get(K key);

    @override
    V delete(K key);

    @override
    void set(K key,V value);

    V operator [](K key){
        return this.get(key);
    }

    void operator []=(K key,V value){
        return this.set(key,value);
    }

    void callDynamically(Invocation m){
      var mirror = reflect(this.store);
      mirror.invoke(m.memberName,m.positionalArguments);
    }
}

abstract class _Storage2D<T,V> implements Methodable{
    final String id;
    T store;

    _Storage2D._init(this.id);
    
    @override
    V get(key);

    @override
    V delete(key);

    @override
    void set(key,V value);

    V operator [](key){
        return this.get(key);
    }

    void operator []=(key,V value){
        return this.set(key,value);
    }
    
    void callDynamically(Invocation m){
      var mirror = reflect(this.store);
      mirror.invoke(m.memberName,m.positionalArguments);    
    }
}

