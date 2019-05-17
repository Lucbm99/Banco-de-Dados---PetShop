
drop database if exists PET_SHOP;

create database if not exists PET_SHOP;
use PET_SHOP;

create table if not exists CLIENTE(
idCliente int auto_increment not null,
nomeCliente varchar(30),
CPF char(12),
telefone varchar(15),
primary key (idCliente)
);

create table if not exists ANIMAL(
idAnimal int auto_increment not null,
nomeAnimal varchar(20),
especie varchar(15),
racaAnimal varchar(15),
pesoAnimal decimal(10,3),
dataNascimento date,
idCliente int,
primary key (idAnimal),
foreign key (idCliente) references CLIENTE(idCliente)
);

create table if not exists PRODUTOS_SERVICOS(
idProdutos_Servicos int auto_increment not null,
nome varchar(30),
descricao varchar(30),
valor decimal(10,2),
fornecedor varchar(30),
tipo varchar(45),
primary key (idProdutos_Servicos)
);

create table if not exists VENDAS(
idVendas int auto_increment not null,
quantidade int,
dataVenda date,
valorTotal decimal(10,2),
idCliente int,
primary key (idVendas),
foreign key (idCliente) references CLIENTE(idCliente)
);

create table if not exists ITEM(
quantidade int,
valorTotal decimal(10,2),
idVendas int,
idProdutos_Servicos int,
primary key (idVendas, idProdutos_Servicos),
foreign key (idVendas) references VENDAS (idVendas),
foreign key (idProdutos_Servicos) references PRODUTOS_SERVICOS (idProdutos_Servicos)
);

/* inserir valores --> idCliente, nome, CPF, telefone*/
insert into CLIENTE values
(null, 'João Paulo', '36602530261', '38953545'),
(null, 'José Franco', '43912216835', '38074206'),
(null, 'Cezar Gonçalves', '28851360812', '39554522'),
(null, 'Orlando Bezerra', '35467123044', '32194442');

/*inserir valores --> idAnimal, nomeAnimal, especie, racaAnimal, pesoAnimal, data de Nascimento, idCliente*/
insert into ANIMAL values
(null, 'Tobias', 'Cachorro', 'Buldogue', 24.500, '2015-11-15', 1),
(null, 'Fred', 'Cachorro' , 'Pastor Alemão', 21.500, '2012-04-23', 2),
(null, 'Bob', 'Hamster', 'Hamster anão chinês', 1.500, '2009-03-24', 3),
(null, 'Elliot', 'Gato', 'Persa', 3.6000, '2015-09-22', 1),
(null, 'Floquinho', 'Gato' , 'Siamês', 5.2000, '2016-05-11', 2),
(null, 'Sansão', 'Pássaro', 'Pardal', 1.400, '2016-04-04', 3),
(null, 'Loop', 'Cachorro', 'Poodle', 13.700, '2015-07-22', 1),
(null, 'Frodo', 'Pássaro' , 'Pintassilgo', 1.350, '2012-06-04', 2),
(null, 'Coringa', 'Coelho', 'Fuzzy lop', 1.400, '2009-12-15', 3),
(null, 'Fido', 'Peixe', 'Bagre', 1.200, '2017-05-14', 3);

/*inserir valores --> idProdutos_Servicos, nome, descricao, valor, fornecedor, tipo*/
insert into PRODUTOS_SERVICOS values
(null, 'Tosa', 'Aparar os pêlos', 40.00, 'Pet Shop R', 'Serviço'),
(null, 'Ração Frango', 'Alimento para cães/gatos', 12.00, 'Pedigree', 'Produto'),
(null, 'Banho', 'Lavar os pêlos', 20.00, 'Pet Shop R', 'Serviço'),
(null, 'Ração Carne', 'Alimento para cães/gatos', 15.00, 'Pedigree', 'Produto'),
(null, 'Vacina anti-raiva', 'Medicação', 15.00, 'Pet Shop R', 'Serviço'),
(null, 'Alpiste', 'Alimento para pássaros', 5.00, 'Magnus', 'Produto'),
(null, 'Girassol', 'Alimento para pássaros', 3.50, 'Magnus', 'Produto'),
(null, 'Painço', 'Alimento para pássaros', 6.70, 'Magnus', 'Produto'),
(null, 'Escovação', 'Escovar os pêlos', 25.00, 'Pet Shop R', 'Serviço'),
(null, 'Ração para Peixes', 'Alimento para peixes',5.00, 'Magnus', 'Produto');

insert into VENDAS values 
/*inserir valores --> idVendas, quantidade, dataVenda, valorTotal, idCliente*/
(null, 2, '2010-04-25', 35.50, 1),
(null, 3, '2010-11-01', 11.60, 2),
(null, 5, '2014-03-07', 12.15, 3),
(null, 4, '2014-06-26', 25.90, 3),
(null, 2, '2018-12-31', 15.30, 2),
(null, 3, '2018-02-23', 41.35, 1),
(null, 5, '2013-04-19', 10.90, 2),
(null, 7, '2013-09-12', 8.45, 1),
(null, 2, '2015-05-11', 3.75, 3),
(null, 1, '2015-08-06', 3.75, 2);

/*inserir valores --> idItem, quantidade, valorTotal, idVendas, idProdutos_Servicos*/
insert into ITEM values 
(2, 32.00, 1, 1),
(2, 35.00, 2, 2),
(2, 60.00, 2, 3),
(2, 52.00, 3, 4),
(2, 30.00, 5, 6),
(2, 8.50, 7, 8),
(2, 35.00, 1, 4),
(3, 23.70, 2, 5),
(2, 65.00, 7, 6);

select * from CLIENTE;
select * from ANIMAL;
select * from PRODUTOS_SERVICOS;
select * from VENDAS;
select * from ITEM;

/*1. Exibir os dados dos animais (nome, espécie e raça) com os respectivos nomes de clientes.*/
select CC.idAnimal, CC.nomeAnimal, CC.especie, CC.racaAnimal, C.nomeCliente, C.idCliente
from ANIMAL CC, CLIENTE C
where CC.idCliente=C.idCliente;  

/*2. Quais os produtos cadastrados são Pedigree?*/
select * from produtos_servicos p where p.fornecedor like '%Pedigree%';

/*3. Qual é o cliente que tem um hamster como animal de estimação?*/  
select E.idAnimal, C.nomeCliente, E.especie 
from ANIMAL E inner join CLIENTE C
on E.idCliente = C.idCliente where E.especie like '%Hamster%';

/*4. Qual a média do peso dos animais cadastrados? */
/*média dos pesos dos animais na tabela ANIMAL com titulo "média dos pesos" */
select*from ANIMAL;
select round(avg(pesoAnimal),2)  as 'Média dos pesos' from ANIMAL;

/*5. Qual o valor da venda mais cara realizada pela loja?
Maior preço na tabela VENDAS com titulo "Venda mais cara" */
select*from VENDAS;
select max(valorTotal) as 'Venda mais cara' from VENDAS; 

/*6. Qual o valor do produto ou serviço mais barato? */
/*Menor preço na tabela PRODUTOS_SERVICOS com titulo "Menor Preço" */
select*from PRODUTOS_SERVICOS;
select min(valor) as 'Menor Preço' from PRODUTOS_SERVICOS; 

/*7. Qual a soma do preço de todos os itens? */
/*Soma dos preços dos itens na tabela ITEM*/
select sum(valorTotal) from ITEM;

/*8. Qual o cliente tem o animal de menor peso?*/     
/*Junção de duas tabelas com inner join para saber o cliente que tem o animal de menor peso*/   
select E.idAnimal, C.nomeCliente, E.pesoAnimal 
from ANIMAL E inner join CLIENTE C
on E.idCliente = C.idCliente where E.pesoAnimal = (select min(animal.pesoAnimal) from animal);

/*9. Quais são os clientes que fizeram compras abaixo de 50$?*/
select C.nomeCliente, sum(valorTotal)
from VENDAS CC, cliente C 
where  c.idCliente=cc.idCliente 
group by c.idCliente 
having sum(valorTotal) < 50.00;

/*10. Listar as três vendas que contém maior número de itens por venda.*/
select v.idVendas, v.dataVenda, v.valorTotal, count(i.idVendas) as 'itens' from item i 
inner join vendas v on i.idVendas = v.idVendas
group by v.idVendas order by itens desc limit 3;

/*11. Listar as vendas que o pet shop realizou depois de 2016, agrupando por cliente.*/
select c.idCliente, c.nomeCliente, v.idVendas, v.dataVenda, v.valorTotal from cliente c
inner join vendas v on v.idCliente = c.idCliente
where v.dataVenda >='2016-01-01';

/*12. Qual cliente não possui nenhuma compra?*/
select idCliente, nomeCliente from cliente
where idCliente not in 
(select idCliente from VENDAS)  



