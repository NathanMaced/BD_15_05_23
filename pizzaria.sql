DROP DATABASE IF EXISTS Pizzaria;

CREATE DATABASE IF NOT EXISTS Pizzaria;

USE Pizzaria;

create table Clientes(
    codcliente int not null,
    nomecliente varchar(50) not null,
    rua varchar(100) not null,
    cep varchar (9) not null,
    compl varchar (100) not null,
    bairro varchar (30) not null,
    telefone varchar(14) not null,
    primary key (codcliente)
);

insert into Clientes(1,'Nathan','Paulista','04849567','casa 2','Santo Amaro','40028922'),(2,'Robelino','Boa vista','04849000','apartamento 2','Grajau','59323030'),(3,'Luana','Copacabana','04849234','casa 5','Cotia','59313302'),(4,'Gilberto','IRmã Agostina','04849767','casa 2','Interlagos','59328922'),(5,'Agel','Pioneiro','04849427','casa 1','Grajau','55552222');

create table Pizzas(
    codpizza int not null,
    nomepizza varchar(50) not null,
    ingredientes varchar(150) not null,
    tamanho varchar(7) not null,
    precopizza decimal(5,2) not null,
    primary key (codpizza)
);



create table Bebidas(
    codbebida int not null ,
    nomebebida varchar (30) not null,
    peso int not null,
    precobebeida decimal (5,2) not null,
    primary  key (codbebida)
);

insert into(1,'Coca cola','500','11.00'),(2,'Fanta','500','9.00'),(3,'Guarana','500','10.00');

create table Pedidos(
    codpedido int not null,
    datapedido date not null,
    codcliente int not null,
    primary key (codpedido),
    CONSTRAINT FK_Pedidos_Clientes FOREIGN KEY (codcliente) REFERENCES Clientes (codcliente)
);
create table PizzasPedidas(
    codpedido int not null,
    codpizza int not null,
    quantidade int not null,
    primary key (codpedido, codpizza),
    CONSTRAINT FK_PizzasPedidas_Pedidos FOREIGN KEY (codpedido) REFERENCES Pedidos (codpedido),
    CONSTRAINT FK_PizzasPedidas_Pizzas FOREIGN KEY (codpizza) REFERENCES Pizzas (codpizza)
);
create table BebidasPedidas(
    codpedido int not null,
    codbebida int not null,
    quantidade int not null,
    primary key (codpedido, codbebida),
    CONSTRAINT FK_BebidasPedidas_Pedidos FOREIGN KEY (codpedido) REFERENCES Pedidos (codpedido),
    CONSTRAINT FK_BebidasPedidas_Bebidas FOREIGN KEY (codbebida) REFERENCES Bebidas (codbebida)
);

