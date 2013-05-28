import '../lib/storage.dart';

main(){
  
  var s = new MapStorage<String,String>('testable');
  
  s.set('name','alex');
  s.set('state','lagos');
  s['age'] = '20';
  
  print(s.store);
  print(s.get('name'));
  print(s.values());

  s.forEach((k,v){
    print('Found $k:$v');
  });


}
