class Valores{
  static const rotaRaiz = "/";
  static const rotaLogin = "/Login";
  static const rotaPerfil = "/Login/Perfil";
  static const rotaRanking = "/Login/Ranking";
  static const rotaPrincipal = "/Login/Principal";
  static const rotaUnidades = "/Login/Principal/Unidades";
  static const rotaAssuntos = "/Login/Principal/Unidades/Assuntos";
  static const rotaQuizz = "/Login/Principal/Unidades/Assuntos/Quizz";

  static var idDisciplinaSelecionada;
  static var idUnidadeEnsionoSelecionada;
  static var idAssuntoSelecionado;

  static const _cores = [0xFF7B68EE, 0xFF9370DB, 0xFF8A2BE2, 0xFF9400D3, 0xFF9932CC, 0xFFBA55D3, 0xFFA020F0, 0xFF8B008B, 0xFFFF00FF, 0xFFEE82EE, 0xFFDA70D6, 0xFFDDA0DD];//0xFF4B0082, ];
  static getCor(indice){ return _cores[indice % _cores.length]; }
}