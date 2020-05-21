class Valores{
  static const rotaRaiz = "/";
  static const rotaLogin = "/Login";
  static const rotaPerfil = "/Login/Perfil";
  static const rotaRanking = "/Login/Ranking";
  static const rotaPrincipal = "/Login/Principal";
  static const rotaUnidades = "/Login/Principal/Unidades";
  static const rotaAssuntos = "/Login/Principal/Unidades/Assuntos";
  static const rotaQuizz = "/Login/Principal/Unidades/Assuntos/Quizz";
  static const rotaMateriais = "/Login/Principal/Unidades/Assuntos/Materiais";

  static var idDisciplinaSelecionada;
  static var idUnidadeEnsionoSelecionada;
  static var idAssuntoSelecionado;

  static const _cores = [0xFF4c2a88, 0xFF7f39fb];
  static getCor(indice){ return _cores[indice % _cores.length]; }
}