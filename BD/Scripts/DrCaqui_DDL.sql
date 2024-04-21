CREATE DATABASE DR_CAQUI_DB;

USE DR_CAQUI_DB;

CREATE TABLE tipoUsuario(
	idTipoUsuario tinyint primary key AUTO_INCREMENT,
	nomeTipo varchar(15) not null unique
);

CREATE TABLE raca(
	idRaca tinyint primary key AUTO_INCREMENT,
	raca varchar(15) not null unique
);

CREATE TABLE mchat(
	idMchat tinyint primary key AUTO_INCREMENT,
	marco varchar(80) not null unique,
	descricao varchar(700) not null,
	idadeLimit tinyint not null
);


CREATE TABLE endereco(
	idEndereco int primary key AUTO_INCREMENT,
	cidade varchar(40) not null,
	bairro varchar(40) not null,
	rua varchar (100) not null,
	numero smallint not null
);


CREATE TABLE usuario (
	idUsuario int primary key AUTO_INCREMENT,
	idTipoUsuario tinyint,
    foreign key (idTipoUsuario) references tipoUsuario(idTipoUsuario),
	nomeUsuario varchar(32) not null unique,
	login varchar(32) not null unique,
	senha varchar(32) not null
);


CREATE TABLE pai(
	idPai int primary key AUTO_INCREMENT,
	idUsuario int,
    foreign key (idUsuario) references usuario(idUsuario),
	idEndereco int,
    foreign key (idEndereco) references endereco(idEndereco),
	cpfPai varchar(32) not null unique
);

CREATE TABLE mae(
	idMae int primary key AUTO_INCREMENT,
	idUsuario int,
    foreign key (idUsuario) references usuario(idUsuario),
	idEndereco int,
    foreign key (idEndereco)references endereco(idEndereco),
	cpfMae varchar(32) not null,
	gravidez binary not null,
	zs1 binary not null,
	a53 binary not null,
	b18 binary not null,
	b58 binary not null
);


CREATE TABLE crianca(
	idCrianca int primary key AUTO_INCREMENT,
	idMae int,
    foreign key (idMae) references mae(idMae),
	idPai int,
    foreign key (idPai) references pai(idPai),
	idRaca tinyint,
    foreign key (idRaca) references raca(idRaca),
	nomeCrianca varchar(32) not null,
	dataNascimento date not null,
	cpfCrianca varchar(32) not null unique,
	municipioNascimento varchar(40) not null,
	sexo binary not null,
	ortolani binary not null,
	reflexoVermelho binary not null,
	pezinho binary not null,
	triagemAuditiva binary not null
);

CREATE TABLE nutricao(
	idCrianca int primary key AUTO_INCREMENT,
	idMae int,
    foreign key (idMae) references mae(idMae),
	suplemento varchar(70) not null
);

CREATE TABLE marcoCrianca(
	idMarcoCrianca int primary key AUTO_INCREMENT,
	idCrianca int,
    foreign key (idCrianca) references crianca(idCrianca),
	idMchat tinyint,
    foreign key (idMchat) references mchat(idMchat),
	idadeCrianca smallint not null,
	constraint marcoUnico UNIQUE(idCrianca, idMchat, idadeCrianca)
);

CREATE TABLE exame(
	idExame int primary key AUTO_INCREMENT,
	idCrianca int,
    foreign key (idCrianca) references crianca(idCrianca),
	idUsuario int,
    foreign Key (idUsuario) references usuario(idUsuario),
	tituloExame varchar(50) not null,
	descricaoExame varchar(400) not null
);

CREATE TABLE medAntropometrica(
	idMed int primary key AUTO_INCREMENT,
	idCrianca int,
    foreign key (idCrianca) references crianca(idCrianca),
	dataMed date not null,
	idade tinyint not null,
	peso decimal not null,
	estatura decimal not null,
	perimetroCefalico decimal not null,
	imc decimal not null
);

select * from mchat

