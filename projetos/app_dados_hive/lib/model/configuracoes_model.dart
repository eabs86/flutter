class ConfiguracoesModel{
  
  String _nomeUsuario="";
  double _altura = 0;
  bool _receberPushNotification = false;
  bool _temaEscuro = false ;

  
  ConfiguracoesModel.vazio(){
    _nomeUsuario="";
    _altura = 0;
    _receberPushNotification = false;
    _temaEscuro = false;
  }

  ConfiguracoesModel(this._nomeUsuario, this._altura, this._receberPushNotification, this._temaEscuro); //construtor 

  String get nomeUsuario => _nomeUsuario;
  double get altura => _altura;
  bool get receberPushNotification => _receberPushNotification;
  bool get temaEscuro => _temaEscuro;

  set nomeUsuario(String nomeUsuario){
    _nomeUsuario = nomeUsuario;
  }
  set alturaUsuario(double altura){
    _altura = altura;
  }
  set receberPushNotification(bool receberPushNotification){
    _receberPushNotification = receberPushNotification;
  }
  set temaEscuro(bool temaEscuro){
    _temaEscuro = temaEscuro;
  }

}