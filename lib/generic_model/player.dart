
class Player{
    String imagemDePerfil;
    String nome;
    int nivel;
    int _fome;
    int _saude;
    int _lazer;
    int _conhecimento;
    double _patrimonio;
    double _rendaDiaria;

    Player(this.nome, this._fome, this._saude, this._lazer, this._conhecimento, this._patrimonio, this._rendaDiaria,
        this.nivel, this.imagemDePerfil);

    int get fome => _fome;
    set fome(int valor) => _fome += valor;

    int get saude => _saude;
    set saude(int valor) => _saude += valor;

    int get lazer => _lazer;
    set lazer(int valor) => _lazer += valor;

    int get conhecimento => _conhecimento;
    set conhecimento(int valor) => _conhecimento += valor;

    double get patrimonio => _patrimonio;
    set patrimonio(double valor) => _patrimonio += valor;

    double get rendaDiaria => _rendaDiaria;
    set rendaDiaria(double valor) => _rendaDiaria += valor;
}