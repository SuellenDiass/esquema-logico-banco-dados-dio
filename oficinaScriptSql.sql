-- Criação de Banco de Dados para Oficina

create database oficina;
use oficina;

-- Criar tabela cliente
-- drop table 'nome tabela' exclui tabela criada
create table cliente(
	idCliente int auto_increment primary key,
    nome varchar(45),
    contato char(11),
    CNH char(11) not null,
    endereço varchar(45),
    constraint unique_CNH_client unique(CNH)
);	
create table mecanico(
	idMecanico int auto_increment primary key,
    nome varchar(45),
    endereço varchar(45),
    CPF char(9) not null,
    contato char(11),
    constraint unique_CPF_client unique(CPF)
);	

create table veiculo(
idVeiculo  int auto_increment primary key,
idMecanico int,
idClient int,
modelo varchar(45),
marca varchar(45),
placa varchar(8),
renavam varchar (9),
constraint fk_veiculo_mecanico foreign key(idVeiculo) references mecanico (idMecanico ),
constraint fk_veiculo_cliente foreign key(idMecanico) references cliente(idCliente)

);

create table revisão(
idRevisão int auto_increment primary key,
idMecanico int,
idVeiculo int,
datas date,
horario time,
valor float,
status enum ('Em andamento') default 'Em andamento',
constraint fk_revisao_mecanico foreign key(idMecanico) references mecanico (idMecanico ),
constraint fk_veiculo_veiculo foreign key(idVeiculo) references veiculo(idVeiculo)
);
show tables

