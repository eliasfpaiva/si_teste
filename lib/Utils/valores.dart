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

  static int matriculaAlunoLogado;
  static int idDisciplinaSelecionada;
  static int idUnidadeEnsionoSelecionada;
  static int idAssuntoSelecionado;

  static const _cores = [0xFF4c2a88, 0xFF7f39fb];
  static getCor(indice){ return _cores[indice % _cores.length]; }

  static ehAluno(String matricula){
    Set<int> matriculasTeste = {325258, 359724, 426746, 426759, 459244, 500606, 516806, 521394, 527018, 555773, 567677, 567703, 567727, 571361, 572714, 574578, 574614, 578811, 580949, 588776, 590122, 590128, 598147, 599947, 599948, 599949, 599950, 599952, 600049};

    return matriculasTeste.contains(int.parse(matricula));
  }
}