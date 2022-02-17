// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterController on _CharacterControllerBase, Store {
  final _$dioAtom = Atom(name: '_CharacterControllerBase.dio');

  @override
  Dio get dio {
    _$dioAtom.reportRead();
    return super.dio;
  }

  @override
  set dio(Dio value) {
    _$dioAtom.reportWrite(value, super.dio, () {
      super.dio = value;
    });
  }

  final _$actualPageAtom = Atom(name: '_CharacterControllerBase.actualPage');

  @override
  int get actualPage {
    _$actualPageAtom.reportRead();
    return super.actualPage;
  }

  @override
  set actualPage(int value) {
    _$actualPageAtom.reportWrite(value, super.actualPage, () {
      super.actualPage = value;
    });
  }

  final _$getCharactersAsyncAction =
      AsyncAction('_CharacterControllerBase.getCharacters');

  @override
  Future<List<CharacterModel>> getCharacters(dynamic page) {
    return _$getCharactersAsyncAction.run(() => super.getCharacters(page));
  }

  final _$getCharactersEpisodesAsyncAction =
      AsyncAction('_CharacterControllerBase.getCharactersEpisodes');

  @override
  Future<List<EpisodesModel>> getCharactersEpisodes(
      dynamic index, dynamic page) {
    return _$getCharactersEpisodesAsyncAction
        .run(() => super.getCharactersEpisodes(index, page));
  }

  final _$_CharacterControllerBaseActionController =
      ActionController(name: '_CharacterControllerBase');

  @override
  dynamic nextPage() {
    final _$actionInfo = _$_CharacterControllerBaseActionController.startAction(
        name: '_CharacterControllerBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_CharacterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic previousPage() {
    final _$actionInfo = _$_CharacterControllerBaseActionController.startAction(
        name: '_CharacterControllerBase.previousPage');
    try {
      return super.previousPage();
    } finally {
      _$_CharacterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dio: ${dio},
actualPage: ${actualPage}
    ''';
  }
}
