CREATE TABLE IF NOT EXISTS Bairro(
	cep INTEGER,
	bairro VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	PRIMARY KEY(cep)
);

CREATE TABLE IF NOT EXISTS Pessoa(
	idPessoa INTEGER,
	nome VARCHAR NOT NULL,
	cpf VARCHAR(14) UNIQUE NOT NULL,
	rua VARCHAR(100),
	idBairro INTEGER NOT NULL,
	PRIMARY KEY(idPessoa),
	FOREIGN KEY(idBairro) REFERENCES Bairro (cep)
);

CREATE TABLE IF NOT EXISTS Cliente(
	idCliente INTEGER,
	idPessoa INTEGER,
	PRIMARY KEY(idCliente),
	FOREIGN KEY(idPessoa) REFERENCES Pessoa (idPessoa)
);

CREATE TABLE IF NOT EXISTS Colaborador(
	idColaborador INTEGER,
	idPessoa INTEGER,
	PRIMARY KEY(idColaborador),
	FOREIGN KEY(idPessoa) REFERENCES Pessoa (idPessoa)
);

CREATE TABLE IF NOT EXISTS Mesa(
	idMesa INTEGER,
	ocupada BOOLEAN,
	PRIMARY KEY (idMesa)
);

CREATE TABLE IF NOT EXISTS Atendimento_Mesa(
	idAtendimentoMesa INTEGER,
	idColaborador INTEGER NOT NULL,
	idCliente INTEGER NOT NULL,
	idMesa INTEGER NOT NULL,
	vlTotalAtendimento MONEY NOT NULL,
	dtInicioAtendimento TIMESTAMP,
	dtFimAtendimento TIMESTAMP,
	PRIMARY KEY (idAtendimentoMesa),
	FOREIGN KEY (idColaborador) REFERENCES Colaborador (idColaborador),
	FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente),
	FOREIGN KEY (idMesa) REFERENCES Mesa (idMesa)
);

CREATE TABLE IF NOT EXISTS Pedido(
	idPedido INTEGER,
	idAtendimentoMesa INTEGER,
	PRIMARY KEY (idPedido),
	FOREIGN KEY (idAtendimentoMesa) REFERENCES Atendimento_Mesa (idAtendimentoMesa)
);

CREATE TABLE IF NOT EXISTS Produto(
	idProduto INTEGER,
	idColaboradorUltimaModificacao INTEGER,
	dtUltimaModificacao TIMESTAMP,
	nome VARCHAR NOT NULL,
	descricao VARCHAR,
	valor MONEY NOT NULL,
	PRIMARY KEY (idProduto),
	FOREIGN KEY (idColaboradorUltimaModificacao) REFERENCES Colaborador (idColaborador)
);

CREATE TABLE IF NOT EXISTS Pedido_Produto(
	idProduto INTEGER,
	idPedido INTEGER,
	qtdProduto INTEGER,
	valorUnitario MONEY NOT NULL,
	valorTotal MONEY NOT NULL,
	status VARCHAR(10),
	PRIMARY KEY (
		idProduto,
		idPedido
	),
	FOREIGN KEY (idProduto) REFERENCES Produto (idProduto),
	FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido)
);

CREATE TABLE Forma_Pagamento(
	idFormaPagamento INTEGER,
	nome VARCHAR(20),
	PRIMARY KEY (idFormaPagamento)
);

CREATE TABLE Pagamento_Pedido(
	idPedido INTEGER,
	idFormaPagamento INTEGER,
	PRIMARY KEY (
		idPedido,
		idFormaPagamento
	),
	FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido),
	FOREIGN KEY (idFormaPagamento) REFERENCES Forma_Pagamento(idFormaPagamento)
);
-- Excluir tabelas
/*
DROP TABLE IF EXISTS Pedido_Produto;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Atendimento_Mesa;
DROP TABLE IF EXISTS Mesa;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Colaborador;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Bairro;
*/
