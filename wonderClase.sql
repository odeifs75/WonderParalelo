drop database if exists wonder;
create database Wonder;
use wonder;

CREATE TABLE usuario (
    nomUsu VARCHAR(20) PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    contraseina VARCHAR(20) NOT NULL
);

create table quiere (
nomUsuCli1 VARCHAR(20),
like1 boolean,
nomUsuCli2 VARCHAR(20),
like2 boolean,
primary key (nomUsuCli1, nomUsuCli2)
);


CREATE TABLE cliente (
    nomUsuCli VARCHAR(20) PRIMARY KEY,
    genero VARCHAR(10),
    edad varchar(20),
   constraint fk_cliente FOREIGN KEY (nomUsuCli)
        REFERENCES usuario (nomUsu)
        on delete cascade on update cascade
);
CREATE TABLE relacion (
    codRela int PRIMARY KEY auto_increment,
    orienSex VARCHAR(20) NOT NULL,
    zodiaco VARCHAR(20),
    gustos VARCHAR(20) NOT NULL,
    queBuscas VARCHAR(20) NOT NULL,
    descrip VARCHAR(100),
    nomUsuCli VARCHAR(20),
   constraint fk_relacion FOREIGN KEY (nomUsuCli)
        REFERENCES cliente (nomUsuCli)
         on delete cascade on update cascade
);

CREATE TABLE administrador (
    nomUsuAd VARCHAR(20) PRIMARY KEY,
    salario float,
   constraint fk_admin FOREIGN KEY (nomUsuAd)
        REFERENCES usuario (nomUsu)
         on delete cascade on update cascade
);

CREATE TABLE ubicacion (
    codUbicacion INT PRIMARY KEY,
    pais VARCHAR(20),
    ciudad VARCHAR(20),
    codPostal INT(5)
);

CREATE TABLE vive (
    codubicacion INT,
    nomUsu VARCHAR(20),
    PRIMARY KEY (codUbicacion , nomUsu),
   constraint fk_vive FOREIGN KEY (nomUsu)
        REFERENCES usuario (nomUsu),
   constraint fk_vive2 FOREIGN KEY (codUbicacion)
        REFERENCES ubicacion (codUbicacion)
         on delete cascade on update cascade
);

CREATE TABLE actividad (
    codactividad INT PRIMARY KEY,
    nomActividad VARCHAR(20),
    fecha DATE,
    descripcion VARCHAR(50)
    
);
/*
CREATE TABLE crear (
    nomUsuCli VARCHAR(20),
    codactividad INT,
    PRIMARY KEY (codactividad , nomUsuCli),
  constraint fk_crear  FOREIGN KEY (nomUsuCli)
        REFERENCES cliente (nomUsuCli),
   constraint fk_crear2 FOREIGN KEY (codactividad)
        REFERENCES actividad (codactividad)
         on delete cascade on update cascade
    
);*/

CREATE TABLE inscribir (
    nomUsuCli VARCHAR(20),
    codactividad INT,
    PRIMARY KEY (codactividad , nomUsuCli),
   constraint fk_inscribir FOREIGN KEY (nomUsuCli)
        REFERENCES cliente (nomUsuCli),
    constraint fk_inscribir2 FOREIGN KEY (codactividad)
        REFERENCES actividad (codactividad)
         on delete cascade on update cascade
    
);

CREATE TABLE gestion (
    nomUsuAd VARCHAR(50),
    nomUsuCli VARCHAR(50),
    PRIMARY KEY (nomUsuAd , nomUsuCli),
   constraint fk_gestion FOREIGN KEY (nomUsuCli)
        REFERENCES cliente (nomUsuCli),
   constraint fk_gestion2 FOREIGN KEY (nomUsuAd)
        REFERENCES administrador (nomUsuAd)
         on delete cascade on update cascade
);


insert into usuario values("alvaro","alvaro@wonder.com","wonder"),
("june","june@wonder.com","wonder"),
("odei","odei@wonder.com","wonder"),
("markel","markel@wonder.com","wonder"),
("gentzane","gentzane@wonder.com","wonder"),
("raquel","raquel@wonder.com","wonder"),
("naia","naia@gmail.com","1234"),
("paco","paco@gmail.com","paco12");
insert into administrador values("alvaro", 1400),
("june", 1500),
("odei", 1400),
("markel", 1500),
("gentzane",1100),
("raquel",1000);
insert into cliente values("naia","mujer","28"),
("paco","hombre","50");
insert into relacion values("01", "Heterosexual","Aries","Natacion", "Amistad","Me gustaria encontrar una persona especial","naia"),
("02", "Homosexual","","Musica", "Relacion","Me gustaria alguien para compartir experiencia","paco");

insert into actividad values("1", "natacion", "1222/12/12", "descripcion");
insert into crear values("paco","1");

select * from cliente;
select * from relacion;
select * from usuario;
select nomUsu, email, contraseina, genero, edad, orienSex, zodiaco, gustos, queBuscas, descrip from usuario u join cliente c on u.nomUsu=c.nomUsuCli join relacion r on r.nomUsuCli=c.nomUsuCli;
select * from crear;
select * from actividad;