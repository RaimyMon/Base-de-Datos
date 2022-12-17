--Raymi Antonio Montero

CREATE DATABASE Laboratorio_Db
GO

USE Laboratorio_Db
GO

CREATE TABLE [Paciente](
  [Paciente_ID] INT PRIMARY KEY IDENTITY(1,1),
  [Nombre] NVARCHAR(50) NOT NULL,
  [Apellido] NVARCHAR(50) NOT NULL,
  [Direccion] NVARCHAR(250) NOT NULL,
  [FechaNacimiento] DATE,
  [Cedula] NVARCHAR(15) NOT NULL UNIQUE,
  [Edad] INT NOT NULL,
  [Telefono] NVARCHAR(15) NOT NULL,
);

CREATE TABLE [SeguroMedico] (
  [Seguro_ID] INT PRIMARY KEY IDENTITY(1,1),
  [Paciente_ID] INT NOT NULL,
  [Tipo] NVARCHAR(80) NOT NULL,
  [NoAfiliacion] NVARCHAR(50) NOT NULL,
  [FechaCaducidad] DATE,
  CONSTRAINT FK_Paciente_SeguroMedico FOREIGN KEY ([Paciente_ID]) REFERENCES Paciente ([Paciente_ID])
);

CREATE TABLE [Medico] (
  [Medico_ID] INT PRIMARY KEY IDENTITY(1,1),
  [Nombre] NVARCHAR(50) NOT NULL,
  [Apellido] NVARCHAR(50) NOT NULL,
  [Especialidad] NVARCHAR(250) NOT NULL,
  [Area] NVARCHAR(250) NOT NULL,
  [Exequatur] NVARCHAR(10) NOT NULL,
);

CREATE TABLE [Prueba] (
  [Prueba_ID] INT PRIMARY KEY IDENTITY(1,1),
  [Nombre] NVARCHAR(250) NOT NULL,
  [Medico_ID] INT NOT NULL,
  [TipoPrueba] NVARCHAR(50) NOT NULL,
  [Area] NVARCHAR(150) NOT NULL,
  CONSTRAINT FK_Prueba_Medico FOREIGN KEY (Medico_ID) REFERENCES Medico (Medico_ID)
);

CREATE TABLE [Factura] (
  Factura_ID INT PRIMARY KEY IDENTITY(1,1),
  Paciente_ID INT NOT NULL,
  [Prueba_ID] INT NOT NULL,
  [Seguro_ID] INT NULL,
  CONSTRAINT FK_Factura_Paciente FOREIGN KEY (Paciente_ID) REFERENCES Paciente (Paciente_ID),
  CONSTRAINT FK_Factura_Prueba FOREIGN KEY (Prueba_ID) REFERENCES Prueba (Prueba_ID),
  CONSTRAINT FK_Factura_Seguro FOREIGN KEY (Seguro_ID) REFERENCES SeguroMedico (Seguro_ID)
);

INSERT INTO [dbo].[Paciente] VALUES
	('Pablo', 'Rodríguez', 'Villa Altagracia, San Cristobal Barrio Invi', '1993-04-25', '000-1234567-1', 29, '809-111-1111'),
	('Claudia', 'Reyes', 'Villa Altagracia, San Cristobal Barrio Duarte', '1995-05-13', '000-1234567-2', 27, '809-111-2222'),
	('Eduardo', 'Hernandez', 'Villa Altagracia, San Cristobal Barrio Duarte', '1993-06-21', '000-1234567-3', 29, '809-111-3333'),
	('Javier', 'Martinez', 'Villa Altagracia, San Cristobal Barrio Duarte', '1991-05-02', '000-1234567-4', 31, '809-111-4444'),
	('Raquel', 'Garcia', 'Villa Altagracia, San Cristobal Las 10 casitas', '1994-09-25', '000-1234567-5', 28, '809-111-5555'),
	('Marta', 'Gonzales', 'Villa Altagracia, San Cristobal Colina II', '1995-01-04', '000-1234567-6', 27, '809-111-6666'),
	('Katherine', 'De La Cruz', 'Villa Altagracia, San Cristobal Barrio Invi', '1996-10-14', '000-1234567-7', 26, '809-111-7777'),
	('Rosa', 'Lopez', 'Villa Altagracia, San Cristobal Barrio San Francisco', '2002-11-16', '000-1234567-8', 20, '809-111-8888'),
	('Daniel', 'De Los Santos', 'Villa Altagracia, San Cristobal Barrio Duarte', '1996-06-24', '000-1234567-9', 26, '809-111-9999'),
	('Franklin', 'Matos', 'Villa Altagracia, San Cristobal Barrio Quinto Centenario', '1992-10-23', '000-2234567-1', 30, '809-222-1111');

INSERT INTO Medico  VALUES
	('Juan Miguel', 'Pulido', 'Cirujano Plastico', 'Cirugía', '123456'),
	('Nahia', 'Carrasco', 'Pediatra', 'Pediatria', '654123'),
	('Jennifer', 'Cordova', 'Nutricionista', 'Nutricion', '456123'),
	('Daniel', 'Hernandez', 'Odontologo', 'Odontologia', '321456'),
	('Lucía', 'Gonzalez', 'Medico General', 'General', '145236'),
	('Paula', 'Richardson', 'Psicologa', 'Psicología', '632541'),
	('Robert', 'Perez', 'Anestesiologo', 'Cirugía', '154263'),
	('Mario', 'Perez', 'Cardiologo', 'Cardiología', '351426'),
	('Cesar', 'Fernandez', 'Toxicologo', 'Toxicología', '153624'),
	('Cintia', 'Flores', 'Dermatologa', 'Dermatología', '678971');

INSERT INTO SeguroMedico VALUES
	(11, 'SENASA', '0123456789', '2024-10-25'),
	(12, 'SEMMA', '123456789', '2024-10-25'),
	(13, 'ARS PALIC', '1345908', '2024-10-25'),
	(14, 'ARS HUMANO', '0123456789', '2024-10-25'),
	(15, 'ARS MAPHFRE', '13789011', '2024-10-25'),
	(16, 'SENASA', '192948192', '2024-10-25'),
	(17, 'SENASA', '121892193', '2024-10-25'),
	(18, 'SENASA', '10202012', '2024-10-25'),
	(19, 'SENASA', '0123456789', '2024-10-25'),
	(20, 'SENASA', '0123456789', '2024-10-25');

INSERT INTO Prueba VALUES
	('ADN', 9, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA'),
	('ADN', 9, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA'),
	('ADN', 5, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA'),
	('ADN', 9, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA'),
	('ADN', 9, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA'),
	('ADN', 9, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA'),
	('ADN', 5, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA'),
	('ADN', 9, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA'),
	('ADN', 5, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA'),
	('ADN', 5, 'PRUEBAS ESPCIALES', 'HEMATOLOGIA');

INSERT INTO Factura VALUES
	(11, 1, 1),
	(12, 2, NULL),	
	(13, 3, 3),	
	(14, 4, NULL),	
	(15, 5, 5),	
	(16, 6, 6),	
	(17, 7, 7),	
	(18, 8, NULL),	
	(19, 9, 9),	
	(20, 10, 10);
