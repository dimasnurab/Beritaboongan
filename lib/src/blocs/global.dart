import './berita.dart';

class GlobalBloc {
  BeritaBlocs _beritaBlocs;

  BeritaBlocs get beritaBlocs => _beritaBlocs;

  GlobalBloc() {
    _beritaBlocs = BeritaBlocs();
  }

  void dispose() {
    _beritaBlocs.dispose();
  }
}
