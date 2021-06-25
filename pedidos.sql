DROP DATABASE IF EXISTS spring;
CREATE DATABASE spring;
USE spring;

DROP TABLE IF EXISTS productos;
CREATE TABLE productos (
  id int(5) unsigned NOT NULL auto_increment,tblproductos
  nombre varchar(50) NOT NULL default '',
  precio int default "0",
  cantidad int default "0",
  PRIMARY KEY  (id),
  UNIQUE KEY id (id),  
  KEY id__2 (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
  id int(5) unsigned NOT NULL auto_increment,
  nombre varchar(50) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY id (id),
  KEY id__2 (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos (
  id int(5) unsigned NOT NULL auto_increment,
  idProducto int(5) unsigned NOT NULL,
  idCliente int(5) unsigned NOT NULL,
  unidades int(5) unsigned,
  PRIMARY KEY  (id),
  UNIQUE KEY id (id),
  KEY id__2 (id),
  foreign key fk_pedidos_productos(idProducto) references productos(id),
  foreign key fk_pedido_clientes(idCliente) references clientes(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE usuarios (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NULL,
  password VARCHAR(200) NULL,
  nombre VARCHAR(200) NULL,
  activo tinyint(1) NOT NULL DEFAULT "1",
  PRIMARY KEY (id),
  UNIQUE KEY (email),
  key (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  
CREATE TABLE roles (
id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
idUsuario INT(10) UNSIGNED NOT NULL,
AUTHORITY VARCHAR(45) NOT NULL,
PRIMARY KEY (id),
KEY FK_user_roles (idUsuario),
CONSTRAINT FK_user_roles FOREIGN KEY (idUsuario) REFERENCES usuarios (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE generos (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(200) NULL,
  PRIMARY KEY (id)) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
  
CREATE TABLE artistas (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(200) NULL,
  fotoUrl VARCHAR(2083) NULL,
  sitioUrl VARCHAR(2083) NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;  

CREATE TABLE albumes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  idArtista INT UNSIGNED NULL,
  idGenero INT UNSIGNED NULL,
  titulo VARCHAR(200) NULL ,
  lanzamiento DATE NULL,
  portadaUrl VARCHAR(2083) NULL,
  precio DECIMAL(12,2) NULL DEFAULT "0",
  PRIMARY KEY (id),
  KEY FK_user_roles (idGenero),
CONSTRAINT FK_albumes_generos FOREIGN KEY (idGenero) REFERENCES generos (id),
KEY FK_albumnes_generos (idArtista),
CONSTRAINT FK_albumnes_artistas FOREIGN KEY (idArtista) REFERENCES artistas (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

-- pedidos
INSERT INTO productos VALUES("1", "Marco foto plateado","50","20");
INSERT INTO productos VALUES("2", "Figura Marilyn","100","30");
INSERT INTO clientes VALUES("1", "Pepe");
INSERT INTO pedidos VALUES("1", "1", "1", "3");
-- usuarios
INSERT INTO usuarios VALUES("1", "admin@email.com", "nimda01", "ADMINISTRADOR","1");
INSERT INTO usuarios VALUES("2", "member@email.com", "member01", "MEMBER","1");
INSERT INTO roles (idUsuario,AUTHORITY) VALUES ("1", "ROLE_MEMBER");
INSERT INTO roles (idUsuario,AUTHORITY) VALUES ("1", "ROLE_ADMIN");
INSERT INTO roles (idUsuario,AUTHORITY) VALUES ("2", "ROLE_MEMBER");
/* albumes artistas generos */
INSERT INTO generos (nombre) VALUES ("Jazz"), ("Pop"), ("Electrónica"), ("Alternativa - Indie - Independiente"), ("Reggaeton - Latina");
INSERT INTO artistas (nombre,fotoUrl,SitioUrl) 
	VALUES ("Nora Jones","https://charts-static.billboard.com/img/2016/12/norah-jones.jpg","https://www.billboard.com/music/norah-jones"),
   		   ("Diana Krall","https://charts-static.billboard.com/img/2017/08/diana-krall.jpg","https://www.billboard.com/music/diana-krall"),
           ("Lorde","https://charts-static.billboard.com/img/2017/07/lorde.jpg","https://www.billboard.com/music/lorde"),
           ("Paramore","https://charts-static.billboard.com/img/2017/06/paramore.jpg","https://www.billboard.com/music/paramore"),
           ("Jlin","https://www.billboard.com/files/songs/1/205103320.jpg",""),
           ("Juana Molina","https://charts-static.billboard.com/img/2017/05/juana-molina.jpg","https://www.billboard.com/music/juana-molina"),
           ("Portugal. The Man","https://charts-static.billboard.com/img/2007/08/portugal-the-man-l5z.jpg","https://www.billboard.com/music/portugal-the-man"),
           ("Destroyer","https://charts-static.billboard.com/img/2006/03/destroyer-hgs.jpg",""),
           ("Luis Fonsi, Demi Lovato","https://www.billboard.com/files/artists/l/3173480.jpg","https://www.billboard.com/music/luis-fonsi"),
           ("Daddy Yankee","https://cdn.tn.com.ar/sites/default/files/styles/1366x765/public/2017/06/14/daddy_yankee_tn.jpg","https://tn.com.ar/musica/hoy/irreconocible-asi-era-daddy-yankee-antes-de-convertirse-en-el-rey-del-reggaeton_799938");
           
INSERT INTO albumes (idArtista,idGenero,titulo,portadaUrl,precio,lanzamiento)
VALUES 
("1","1","Day Breaks","https://charts-static.billboard.com/img/2016/10/norah-jones-ugr-day-breaks-zvf-87x87.jpg","19.99",'2016-10-07'),
("2","1","Turn Up The Quiet","https://charts-static.billboard.com/img/2017/05/diana-krall-dcg-87x87.jpg","15.99",'2017-05-05'),
("3","2","Melodrama","https://cdn.albumoftheyear.org/album/thumbs/73950-melodrama.jpg","9.99",'2017-05-16'),
("4","2","After Laugther","https://cdn.albumoftheyear.org/album/2017/77787-after-laughter.jpg","16.50",'2017-05-12'),
("5","3","Black Origami","https://cdn.albumoftheyear.org/album/74996-black-origami.jpg","18.35",'2017-05-11'),
("6","3","Halo","https://cdn.albumoftheyear.org/album/thumbs/2017/73385-halo.jpg","18.00",'2017-05-05'),
("7","4","Woodstock","https://upload.wikimedia.org/wikipedia/en/thumb/1/1a/Portugal._The_Man_Woodstock_album_cover.jpg/220px-Portugal._The_Man_Woodstock_album_cover.jpg","3.99",'2017-06-17'),
("8","4","Ken","https://exclaim.ca/images/kenart.jpg","4.99",'2017-04-21'),
("9","5","Échame La Culpa","https://cdn.albumoftheyear.org/album/95135-chame-la-culpa.jpg","7.99",'2017-12-17'),
("10","5","Dura","https://cdn.albumoftheyear.org/album/100162-dura.jpg","5.99",'2018-01-01');tblcategorias