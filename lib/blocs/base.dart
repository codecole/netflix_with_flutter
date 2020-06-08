import 'package:codecole/models/base_models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:codecole/resources/repository.dart';

abstract class BaseBloc <T extends BaseModel>{
  final repository = Repository();
  final fetcher = PublishSubject<T>();

  dispose(){
    fetcher.close();
  }
}