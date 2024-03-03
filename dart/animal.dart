class Animal {
  final int? id;
  final String? nome;
  final int? idade;
  final String? raca;
  final String? tipo;
  final String? observacao;

  Animal({this.id, this.nome, this.idade, this.raca, this.tipo, this.observacao});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'] as int?,
      nome: json['nome'] as String?,
      idade: json['idade'] as int?,
      raca: json['raca'] as String?,
      tipo: json['tipo'] as String?,
      observacao: json['observacao'] as String?,
    );
  }
}

