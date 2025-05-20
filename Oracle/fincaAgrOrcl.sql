--
-- Table structure for table `tbl_categoria`
--

CREATE TABLE tbl_categoria (
  cat_id int generated always as identity PRIMARY KEY,
  cat_nombre varchar(45) CONSTRAINT cat_nombre_UNIQUE UNIQUE NOT NULL,
  cat_descripcion varchar(100) NOT NULL
);

--
-- Table structure for table `tbl_finca`
--

CREATE TABLE tbl_finca (
  fin_id int generated always as identity PRIMARY KEY,
  fin_nombre varchar(45) CONSTRAINT fin_nombre_UNIQUE UNIQUE NOT NULL,
  fin_ubicacion varchar(45) NOT NULL
);

--
-- Table structure for table `tbl_producto`
--
CREATE TABLE tbl_producto (
  pro_id int generated always as identity PRIMARY KEY,
  pro_nombre varchar(45) CONSTRAINT pro_nombre_UNIQUE UNIQUE NOT NULL,
  pro_descripcion varchar(100) NOT NULL,
  pro_cantidad_inventario int NOT NULL,
  pro_contenido int NOT NULL,
  pro_precio NUMBER(10, 2) NOT NULL,
  pro_img VARCHAR(100) NOT NULL,
  tbl_finca_fin_id int NOT NULL,
  tbl_categoria_cat_id int NOT NULL,
  FOREIGN KEY (tbl_finca_fin_id) REFERENCES tbl_finca (fin_id),
  FOREIGN KEY (tbl_categoria_cat_id) REFERENCES tbl_categoria (cat_id)
);

--
-- Table structure for table `tbl_cliente`
--

CREATE TABLE tbl_cliente (
  cli_id int generated always as identity PRIMARY KEY,
  cli_nombre varchar(45) NOT NULL,
  cli_correo VARCHAR2(80) CONSTRAINT cli_correo_UNIQUE UNIQUE NOT NULL,
  cli_contrasena VARCHAR2(45) NOT NULL,
  cli_direccion VARCHAR2(80) NOT NULL,
  cli_ciudad varchar(45) NOT NULL
);

--
-- Table structure for table `tbl_venta`
--

CREATE TABLE tbl_venta (
  ven_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tbl_producto_pro_id int NOT NULL,
  tbl_cliente_cli_id int NOT NULL,
  ven_fecha date NOT NULL,
  ven_total int NOT NULL,
  FOREIGN KEY (tbl_cliente_cli_id) REFERENCES tbl_cliente (cli_id),
  FOREIGN KEY (tbl_producto_pro_id) REFERENCES tbl_producto (pro_id)
);

CREATE TABLE tbl_usuario (
  usu_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  usu_username VARCHAR2(50) UNIQUE NOT NULL,
  usu_password_hash VARCHAR2(255) NOT NULL,
  usu_rol VARCHAR2(20) DEFAULT 'usuario' NOT NULL,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--
-- Table structure for table `tbl_parcela`
--

CREATE TABLE tbl_parcela (
  par_id int generated always as identity PRIMARY KEY,
  par_dimensiones int NOT NULL,
  par_ubicacion varchar(45) CONSTRAINT par_ubicacion_UNIQUE UNIQUE NOT NULL,
  par_temperatura NUMBER NOT NULL,
  par_humedad NUMBER NOT NULL,
  tbl_finca_fin_id int NOT NULL,
  FOREIGN KEY (tbl_finca_fin_id) REFERENCES tbl_finca (fin_id)
);

--
-- Table structure for table `tbl_cultivo`
--

CREATE TABLE tbl_cultivo (
  cul_id int generated always as identity PRIMARY KEY,
  cul_nombre varchar(45) CONSTRAINT cul_nombre_UNIQUE UNIQUE NOT NULL,
  cul_descripcion varchar(100) NOT NULL,
  tbl_parcela_par_id int NOT NULL,
  FOREIGN KEY (tbl_parcela_par_id) REFERENCES tbl_parcela(par_id)
);

--
-- Table structure for table `tbl_insumo`
--

CREATE TABLE tbl_insumo (
  ins_id int generated always as identity PRIMARY KEY,
  ins_nombre varchar(45) CONSTRAINT ins_nombre_UNIQUE UNIQUE NOT NULL,
  ins_tipo varchar(45) NOT NULL,
  ins_cantidad varchar(45) NOT NULL,
  tbl_cultivo_cul_id int,
  tbl_parcela_par_id int,
  FOREIGN KEY (tbl_cultivo_cul_id) REFERENCES tbl_cultivo (cul_id),
  FOREIGN KEY (tbl_parcela_par_id) REFERENCES tbl_parcela (par_id)
);

--
-- Table structure for table `tbl_maquinaria`
--

CREATE TABLE tbl_maquinaria (
  ma_id int generated always as identity PRIMARY KEY,
  ma_nombre varchar(80) NOT NULL,
  ma_descripcion varchar(100) NOT NULL,
  ma_clasificacion varchar(45) DEFAULT NULL,
  tbl_cultivo_cul_id int,
  tbl_parcela_par_id INT,
  FOREIGN KEY (tbl_cultivo_cul_id) REFERENCES tbl_cultivo (cul_id),
  FOREIGN KEY (tbl_parcela_par_id) REFERENCES tbl_parcela(par_id)
);

--
-- Table structure for table `tbl_riego`
--

CREATE TABLE tbl_riego (
  rie_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  rie_tipo VARCHAR2(45) NOT NULL,
  rie_cantidad_agua VARCHAR2(45) NOT NULL,
  rie_frecuencia VARCHAR2(20) NOT NULL,
  tbl_cultivo_cul_id INT,
  tbl_parcela_par_id INT,
  FOREIGN KEY (tbl_cultivo_cul_id) REFERENCES tbl_cultivo (cul_id),
  FOREIGN KEY (tbl_parcela_par_id) REFERENCES tbl_parcela(par_id)
); 

--25 Inserts para cada tabla

--tbl_categoria

INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Frutas', 'Frutas frescas de temporada');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Verduras', 'Verduras cultivadas orgánicamente');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Granos', 'Granos como arroz, maíz y trigo');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Tubérculos', 'Alimentos como papas y yucas');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Legumbres', 'Lentejas, frijoles, garbanzos');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Hierbas', 'Hierbas aromáticas y medicinales');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Cítricos', 'Naranjas, limones, mandarinas');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Tropicales', 'Frutas tropicales variadas');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Semillas', 'Semillas comestibles');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Flores comestibles', 'Flores para ensaladas');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Hortalizas', 'Productos de huerta');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Aceites', 'Aceites vegetales');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Condimentos', 'Salsas, aderezos y especias');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Café', 'Granos de café de alta calidad');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Cacao', 'Granos de cacao procesados');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Plantas ornamentales', 'Decorativas');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Frutos secos', 'Nueces, almendras');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Jugos', 'Jugos naturales');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Mermeladas', 'Mermeladas artesanales');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Lácteos', 'Productos con base de leche');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Panadería', 'Pan, bizcochos, galletas');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Enlatados', 'Comida en conserva');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Cereales', 'Cereales para desayuno');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Bebidas', 'Bebidas naturales y fermentadas');
INSERT INTO tbl_categoria (cat_nombre, cat_descripcion) VALUES ('Otros', 'Productos misceláneos');

--tbl_finca

INSERT INTO tbl_finca (fin_nombre, fin_ubicacion) VALUES ('Finca El Paraíso', 'Boyacá');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Santa María', 'Cundinamarca');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca El Rocío', 'Tolima');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Los Pinos', 'Nariño');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Monte Verde', 'Huila');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca El Sol', 'Caldas');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Tierra Fértil', 'Quindío');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Las Margaritas', 'Meta');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca El Edén', 'Santander');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Bella Vista', 'Cauca');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca San Jorge', 'Antioquia');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca El Encanto', 'Cesar');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Buena Tierra', 'Córdoba');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Altamira', 'Magdalena');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Los Olivos', 'Atlántico');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Flor del Campo', 'Valle del Cauca');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca San Sebastián', 'Sucre');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca La Esperanza', 'La Guajira');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca El Reposo', 'Risaralda');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca San Rafael', 'Chocó');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Horizonte Verde', 'Arauca');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Las Palmas', 'Amazonas');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca El Manantial', 'Guaviare');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Campo Claro', 'Vaupés');
INSERT INTO tbl_finca VALUES (DEFAULT, 'Finca Sol Naciente', 'Vichada');

--tbl_producto

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Manzana Roja', 'Fruta fresca y crujiente', 150, 500, 1.50, 'manzana.jpg', 1, 1);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Plátano Maduro', 'Fruta dulce y suave', 200, 1000, 0.90, 'platano.jpg', 2, 2);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Naranja Dulce', 'Fruta cítrica y jugosa', 180, 700, 1.20, 'naranja.jpg', 3, 3);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Lechuga Fresca', 'Hoja verde para ensalada', 120, 250, 0.80, 'lechuga.jpg', 4, 1);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Tomate Cherry', 'Pequeño y dulce', 160, 300, 2.10, 'tomate.jpg', 5, 2);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Papa Criolla', 'Papa pequeña y amarilla', 210, 1000, 1.00, 'papa.jpg', 6, 3);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Cebolla Blanca', 'Ideal para cocinar', 130, 400, 0.60, 'cebolla.jpg', 7, 1);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Zanahoria Orgánica', 'Rica en vitamina A', 170, 500, 1.30, 'zanahoria.jpg', 8, 2);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Aguacate Hass', 'Cremoso y nutritivo', 80, 300, 2.80, 'aguacate.jpg', 9, 3);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Uva Verde', 'Fruta pequeña y jugosa', 140, 250, 2.00, 'uva.jpg', 10, 1);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Mango Biche', 'Exótico y refrescante', 90, 400, 2.50, 'mango.jpg', 11, 2);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Pimentón Rojo', 'Colorido y sabroso', 110, 350, 1.70, 'pimenton.jpg', 12, 3);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Limón Tahití', 'Cítrico y ácido', 200, 600, 0.70, 'limon.jpg', 13, 1);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Espinaca Baby', 'Hoja tierna y saludable', 100, 250, 1.10, 'espinaca.jpg', 14, 2);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Brócoli Fresco', 'Ideal para cocer', 90, 500, 2.30, 'brocoli.jpg', 15, 3);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Calabacín Verde', 'Verdura versátil', 70, 300, 1.20, 'calabacin.jpg', 16, 1);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Pepino Cohombro', 'Refrescante y crujiente', 120, 400, 1.00, 'pepino.jpg', 17, 2);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Melón Cantalupo', 'Fruta dulce y jugosa', 75, 1000, 2.90, 'melon.jpg', 18, 3);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Sandía Roja', 'Fruta grande y refrescante', 60, 4000, 3.40, 'sandia.jpg', 19, 1);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Cilantro Fresco', 'Hierba aromática', 180, 100, 0.50, 'cilantro.jpg', 20, 2);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Remolacha', 'Raíz dulce y colorida', 85, 500, 1.60, 'remolacha.jpg', 21, 3);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Repollo Verde', 'Ideal para ensaladas', 110, 800, 1.40, 'repollo.jpg', 22, 1);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Fresa Orgánica', 'Fruta roja y dulce', 100, 250, 3.10, 'fresa.jpg', 23, 2);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Ajo Morado', 'Condimento esencial', 90, 50, 0.40, 'ajo.jpg', 24, 3);

INSERT INTO tbl_producto (PRO_NOMBRE, PRO_DESCRIPCION, PRO_CANTIDAD_INVENTARIO, PRO_CONTENIDO, PRO_PRECIO, PRO_IMG, TBL_FINCA_FIN_ID, TBL_CATEGORIA_CAT_ID)
VALUES ('Apio España', 'Tallo crujiente', 105, 650, 1.50, 'apio.jpg', 25, 1);

--tbl_usuario
INSERT INTO tbl_usuario (USU_USERNAME, USU_PASSWORD_HASH, USU_ROL)
VALUES ('admin', 'admin1234', 'admin');

--tbl_cliente

INSERT INTO tbl_cliente (cli_nombre, cli_correo, cli_contrasena, cli_direccion, cli_ciudad)
VALUES ('Juan Pérez', 'juanp1@email.com', 'pass1234', 'Cra 45 #23-10', 'Bogotá');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Laura Torres', 'laura.t@email.com', 'securepass', 'Av. 80 #22B', 'Medellín');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Carlos Ruiz', 'carlos.r@email.com', 'car123', 'Calle 9 #45', 'Cali');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Ana Gómez', 'ana.g@email.com', 'gomezana', 'Cra 10 #12-15', 'Barranquilla');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Luis Martínez', 'luis.m@email.com', 'lmart89', 'Cl. 75 #20-35', 'Cartagena');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Marta Salas', 'marta.s@email.com', 'msalas', 'Av. 5 #10', 'Manizales');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Andrés Ríos', 'andres.r@email.com', 'ar2025', 'Cl. 60 #33-12', 'Bucaramanga');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Daniela Vega', 'daniela.v@email.com', 'dv123', 'Cra 3 #50', 'Neiva');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Esteban Mora', 'esteban.m@email.com', 'emora', 'Cl. 32 #19', 'Pereira');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Carmen López', 'carmen.l@email.com', 'clpass', 'Cra 100 #12-34', 'Tunja');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Hugo Díaz', 'hugo.d@email.com', 'hd321', 'Cl. 12 #80', 'Cúcuta');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Natalia Pardo', 'natalia.p@email.com', 'npardo', 'Av. Las Palmas', 'Armenia');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Ricardo Meza', 'ricardo.m@email.com', 'rmz2025', 'Cra 9 #50', 'Popayán');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Sofía León', 'sofia.l@email.com', 'sofi123', 'Cl. 50 #30', 'Ibagué');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Jorge Castro', 'jorge.c@email.com', 'jcpass', 'Cra 13 #7', 'Valledupar');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Mariana Acosta', 'mariana.a@email.com', 'macosta', 'Cl. 14 #14', 'Santa Marta');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Oscar Nieto', 'oscar.n@email.com', 'osni123', 'Av. Central', 'Villavicencio');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Tatiana Londoño', 'tatiana.l@email.com', 'tata2025', 'Cra 25 #25', 'Quibdó');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Sebastián Ramírez', 'sebastian.r@email.com', 'sram', 'Cl. 19 #19', 'Florencia');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Valeria Díaz', 'valeria.d@email.com', 'valdiaz', 'Cra 45A #10', 'Sincelejo');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Camilo Suárez', 'camilo.s@email.com', 'cami123', 'Cl. 11 #11', 'Yopal');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Fernanda Peña', 'fernanda.p@email.com', 'fp2025', 'Av. del Río', 'Leticia');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Diego Vargas', 'diego.v@email.com', 'dvar321', 'Cl. 70 #30', 'Pasto');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Juliana Méndez', 'juliana.m@email.com', 'jm2025', 'Cra 2 #45', 'Riohacha');
INSERT INTO tbl_cliente VALUES (DEFAULT, 'Iván Torres', 'ivan.t@email.com', 'ivanpass', 'Cl. 80 #60', 'San Andrés');

--tbl_venta

INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (1, 1,  DATE '2023-03-10', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (1, 1,  DATE '2023-03-11', 1000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (3, 1,  DATE '2023-03-12', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (2, 1,  DATE '2023-03-13', 1000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (3, 4,  DATE '2023-03-14', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (4, 4,  DATE '2023-03-14', 1000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (4, 4,  DATE '2023-03-15', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (5, 4,  DATE '2023-03-16', 1000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (5, 4,  DATE '2023-03-17', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (4, 1,  DATE '2023-03-18', 1000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (1, 3,  DATE '2023-03-10', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (1, 3,  DATE '2023-03-11', 1000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (3, 8,  DATE '2023-03-12', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (2, 3,  DATE '2023-03-13', 1000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (3, 3,  DATE '2023-03-14', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (1, 2,  DATE '2023-03-20', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (2, 2,  DATE '2023-03-22', 2000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (3, 2,  DATE '2023-03-22', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (2, 5,  DATE '2023-03-23', 2000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (3, 6,  DATE '2023-03-24', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (4, 2,  DATE '2023-03-24', 2000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (4, 2,  DATE '2023-03-25', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (5, 7,  DATE '2023-03-26', 2000);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (5, 2,  DATE '2023-03-27', 500);
INSERT INTO tbl_venta (tbl_producto_pro_id, tbl_cliente_cli_id, ven_fecha, ven_total) VALUES (4, 2,  DATE '2023-03-28', 2000);

--tbl_parcela

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1000, 'Sector A', 25.7, 78.5, 1);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (800, 'Sector B', 26.1, 76.3, 2);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (900, 'Sector C', 24.9, 79.0, 2);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (750, 'Sector D', 27.2, 81.4, 4);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1200, 'Sector E', 28.5, 80.1, 3);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1100, 'Sector F', 29.3, 77.8, 3);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (950, 'Sector G', 26.4, 75.2, 10);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1000, 'Sector H', 25.8, 82.0, 8);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (870, 'Sector I', 27.0, 79.6, 9);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1300, 'Sector J', 28.1, 83.3, 10);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (980, 'Sector K', 24.5, 72.9, 11);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (890, 'Sector L', 23.8, 74.2, 12);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1010, 'Sector M', 22.9, 70.6, 13);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1050, 'Sector N', 24.3, 69.8, 14);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (950, 'Sector O', 26.0, 77.1, 15);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (880, 'Sector P', 28.9, 85.5, 16);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1200, 'Sector Q', 30.1, 88.4, 17);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (990, 'Sector R', 29.7, 84.2, 18);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (970, 'Sector S', 31.5, 86.3, 19);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (860, 'Sector T', 32.0, 87.0, 20);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1005, 'Sector U', 30.8, 82.7, 21);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (935, 'Sector V', 33.4, 89.1, 22);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (890, 'Sector W', 31.2, 85.0, 23);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1020, 'Sector X', 34.0, 88.8, 24);

INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
VALUES (1150, 'Sector Y', 33.7, 90.0, 25);

--tbl_cultivo

INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Papa', 'Papa criolla andina', 2);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Tomate', 'Tomate chonto', 3);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Zanahoria', 'Zanahoria orgánica', 4);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Lechuga', 'Lechuga crespa', 5);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Fríjol', 'Fríjol rojo', 7);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Café', 'Café arábica', 7);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Yuca', 'Yuca dulce', 8);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Plátano', 'Plátano hartón', 9);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Aguacate', 'Aguacate hass', 10);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Cebolla', 'Cebolla larga', 11);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Ajo', 'Ajo criollo', 12);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Mango', 'Mango tommy', 13);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Maracuyá', 'Maracuyá dulce', 15);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Guayaba', 'Guayaba pera', 15);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Cilantro', 'Cilantro para cocina', 16);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Lulo', 'Lulo de clima medio', 18);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Fresa', 'Fresa para postres', 18);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Caña', 'Caña de azúcar', 19);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Remolacha', 'Remolacha roja', 20);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Mora', 'Mora castilla', 21);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Naranja', 'Naranja valencia', 22);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Mandarina', 'Mandarina oneco', 23);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Limón', 'Limón tahití', 25);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Pepino', 'Pepino cohombro', 25);
INSERT INTO tbl_cultivo VALUES (DEFAULT, 'Uva', 'Uva fortuna', 25);

--tbl_insumo

INSERT INTO tbl_insumo (ins_nombre, ins_tipo, ins_cantidad, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id)
VALUES ('Fertilizante NPK', 'Fertilizante', '50 kg', 1, 1);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Herbicida Selectivo', 'Plaguicida', '20 L', 2, 2);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Cal agrícola', 'Acondicionador de suelo', '30 kg', 3, 3);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Sulfato de amonio', 'Fertilizante', '40 kg', 4, 4);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Insecticida biológico', 'Plaguicida', '10 L', 5, 5);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Compost', 'Abono orgánico', '100 kg', 6, 6);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Urea', 'Fertilizante', '60 kg', 7, 7);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Fungicida ecológico', 'Fungicida', '15 L', 8, 9);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Silicato de potasio', 'Acondicionador foliar', '10 L', 9, 9);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Boro líquido', 'Micronutriente', '5 L', 10, 10);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Caldo bordelés', 'Fungicida', '25 L', 11, 11);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Fertilizante foliar', 'Fertilizante', '30 L', 12, 12);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Guano', 'Abono orgánico', '70 kg', 4, 5);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Tricoderma', 'Control biológico', '10 kg', 14, 14);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Micorrizas', 'Biofertilizante', '8 kg', 15, 15);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Roca fosfórica', 'Mineral', '50 kg', 16, 16);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Enmienda calcárea', 'Acondicionador de suelo', '40 kg', 17, 17);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Humus de lombriz', 'Abono orgánico', '90 kg', 18, 18);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Aceite de neem', 'Insecticida natural', '12 L', 19, 19);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Melaza', 'Estimulante', '20 L', 20, 20);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Biochar', 'Acondicionador de suelo', '35 kg', 21, 21);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Zeolita', 'Retención de nutrientes', '25 kg', 22, 22);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Ácidos húmicos', 'Biofertilizante', '15 L', 23, 25);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Oxicloruro de cobre', 'Fungicida', '18 L', 24, 25);
INSERT INTO tbl_insumo VALUES (DEFAULT, 'Extracto de ajo', 'Plaguicida natural', '5 L', 25, 25);

--tbl_maquinaria

INSERT INTO tbl_maquinaria (ma_nombre, ma_descripcion, ma_clasificacion, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id)
VALUES ('Tractor agrícola', 'Tractor John Deere 5055E', 'Pesada', 1, 1);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Arado de discos', 'Arado para suelos compactos', 'Implemento', 2, 2);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Sembradora mecánica', 'Equipo para siembra directa', 'Ligera', 3, 3);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Cultivador', 'Cultivador de precisión', 'Implemento',  4, 5);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Fumigadora de motor', 'Fumigadora para líquidos', 'Portátil', 5, 5);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Cosechadora de papas', 'Cosechadora tipo tolva', 'Pesada', 6, 6);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Desmalezadora', 'Herramienta para limpieza', 'Ligera', 7, 7);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Pulverizadora de mochila', 'Pulverizadora manual', 'Manual', 8, 9);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Picadora de forraje', 'Picadora de alta capacidad', 'Estacionaria', 9, 9);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Tractor pequeño', 'Tractor compacto para laderas', 'Ligera', 10, 10);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Empacadora', 'Empacadora de heno', 'Estacionaria', 11, 11);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Fresadora agrícola', 'Máquina para labranza', 'Implemento', 12, 12);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Rotocultor', 'Rotocultor de eje horizontal', 'Ligera', 13, 13);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Carreta agrícola', 'Transporte de cosechas', 'Remolque', 14, 14);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Trituradora de ramas', 'Trituradora de poda', 'Estacionaria', 15, 15);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Elevador de granos', 'Sistema para silos', 'Estacionaria', 16, 16);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Sistema de riego automatizado', 'Riego por goteo automatizado', 'Ligera', 17, 17);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Mochila aspersora eléctrica', 'Aspersora de batería recargable', 'Manual', 18, 18);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Motocultor', 'Motocultor de doble eje', 'Ligera', 19, 19);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Trilladora portátil', 'Trilladora manual de cereales', 'Manual', 20, 20);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Silo metálico', 'Almacenamiento de granos', 'Estacionaria', 21, 21);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Secadora de maíz', 'Secadora con ventilación forzada', 'Estacionaria', 22, 22);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Atomizador agrícola', 'Equipo de aplicación foliar', 'Manual', 23, 25);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Mulchadora', 'Máquina para cubrir suelo', 'Implemento', 24, 25);
INSERT INTO tbl_maquinaria VALUES (DEFAULT, 'Detector de humedad', 'Detector digital portátil', 'Ligera', 25, 25);

--tbl_riego

INSERT INTO tbl_riego (rie_tipo, rie_cantidad_agua, rie_frecuencia, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id)
VALUES ('Goteo', '500 L', 'Diario', 1, 1);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Aspersión', '700 L', 'Cada 2 días', 2, 2);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Gravedad', '1200 L', 'Semanal', 3, 3);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Microaspersión', '450 L', 'Diario', 4, 5);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Manual', '300 L', 'Cada 3 días', 5, 5);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Riego con manguera', '600 L', 'Diario', 5, 6);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Cintas de riego', '550 L', 'Cada 2 días', 7, 7);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Pivot central', '1000 L', 'Semanal', 8, 9);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Riego aéreo', '800 L', 'Cada 3 días', 9, 9);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Goteo subterráneo', '400 L', 'Diario', 10, 10);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Nebulización', '200 L', 'Cada 2 días', 11, 11);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Aspersores móviles', '900 L', 'Cada 2 días', 12, 12);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Riego solar', '500 L', 'Cada 3 días', 13, 13);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Capilaridad', '250 L', 'Cada 2 días', 14, 14);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Canales abiertos', '1300 L', 'Semanal', 15, 15);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Bidones portátiles', '350 L', 'Diario', 16, 16);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Riego en terrazas', '700 L', 'Semanal', 17, 18);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Riego con aspersores automatizados', '650 L', 'Cada 2 días', 16, 18);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Riego a surcos', '1100 L', 'Cada 3 días', 19, 19);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Riego aéreo con drones', '300 L', 'Cada 4 días', 20, 20);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Tanques de captación', '1000 L', 'Semanal', 21, 21);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Riego rotativo', '600 L', 'Cada 2 días', 22, 22);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Goteo por sensor', '450 L', 'Automático', 23, 25);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Condensación', '250 L', 'Cada 4 días', 24, 25);
INSERT INTO tbl_riego VALUES (DEFAULT, 'Riego por lluvia artificial', '950 L', 'Semanal', 25, 25);
