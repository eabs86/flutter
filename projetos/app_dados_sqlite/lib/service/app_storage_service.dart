import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES{
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_NIVEL,
  CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
  CHAVE_DADOS_CADASTRAIS_SALARIO,
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
  CHAVE_NOME_USUARIO,
  CHAVE_ALTURA_USUARIO, 
  CHAVE_PUSH_NOTIFICATION,
  CHAVE_TEMA_ESCURO,
  CHAVE_NUMERO,
  CHAVE_CLIQUES

}


class AppStorageService{

    // método para setar
   Future <void> _setSring(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  // método para pegar
  Future <String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave)??"";
  }

  Future <void> setDadosCadastraisNome(String nome) async{
    await _setSring(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future <String> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }

  Future <void> setDadosCadastraisDataNascimento(DateTime dataNascimento) async{
   await _setSring(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(), dataNascimento.toString());
  }

  Future <String> getDadosCadastraisDataNascimento() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }

  
  Future <void> setDadosCadastraisNivelExperiencia(String nivel) async{
    await _setSring(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL.toString(), nivel);
  }

  Future <String> getDadosCadastraisNivelExperiencia() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL.toString());
  }


  // Criando o metodo de set para a lista
  Future <void> _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave, values);
  }

  // Criando o metodo de get para a lista
  Future <List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave)??[];
  }

  Future <void> setDadosCadastraisLinguagens(List<String> linguagens) async{
    await _setStringList(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString(), linguagens);
  }

  Future <List<String>> getDadosCadastraisLinguagens() async {
    return _getStringList(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString());

  }

    // Criando o metodo de set para inteiro
  Future <void> _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }

  // Criando o metodo de get para inteiro
  Future <int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave)??0;
  }

  Future <void> setDadosCadastraisTempoExperiencia(int tempoExperiencia) async{
    await _setInt(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(), tempoExperiencia);
  }

  Future <int> getDadosCadastraisTempoExperiencia() async {
    return _getInt(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

    // Criando o metodo de set para double
  Future <void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  // Criando o metodo de get para double
  Future <double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave)??0;
  }

  Future <void> setDadosCadastraisSalario(double salario) async{
    await _setDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), salario);
  }

  Future <double> getDadosCadastraisSalario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }

      // Criando o metodo de set para bool
  Future <void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }

  // Criando o metodo de get para bool
  Future <bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave)??false;
  }


  Future <void> setConfiguracoesNomeUsuario(String nome) async{
    await _setSring(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString(), nome);
  }

  Future <String> getConfiguracoesNomeUsuario() async {
    return _getString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString());
  }

  Future <void> setConfiguracoesAlturaUsuario(double value) async{
    await _setDouble(STORAGE_CHAVES.CHAVE_ALTURA_USUARIO.toString(), value);
  }

  Future <double> getConfiguracoesAlturaUsuario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_ALTURA_USUARIO.toString());
  }

  Future <void> setConfiguracoesPushNotification(bool value) async{
    await _setBool(STORAGE_CHAVES.CHAVE_PUSH_NOTIFICATION.toString(), value);
  }

  Future <bool> getConfiguracoesPushNotification() async {
    return _getBool(STORAGE_CHAVES.CHAVE_PUSH_NOTIFICATION.toString());
  }

  
  Future <void> setConfiguracoesTemaEscuro(bool value) async{
    await _setBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString(), value);
  }

  Future <bool> getConfiguracoesTemaEscuro() async {
    return _getBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString());
  }

  Future <void> setNumeroAleatorio(int value) async{
    await _setInt(STORAGE_CHAVES.CHAVE_NUMERO.toString(), value);
  }

  Future <int> getNumeroAleatorio() async {
    return _getInt(STORAGE_CHAVES.CHAVE_NUMERO.toString());
  }

  Future <void> setQuantidadeCliques(int value) async{
    await _setInt(STORAGE_CHAVES.CHAVE_CLIQUES.toString(), value);
  }

  Future <int> getQuantidadeCliques() async {
    return _getInt(STORAGE_CHAVES.CHAVE_CLIQUES.toString());
  }





}