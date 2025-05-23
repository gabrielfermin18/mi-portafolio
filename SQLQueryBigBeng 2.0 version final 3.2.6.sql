-- Crear la base de datos
CREATE DATABASE BDBigBeng;
GO

-- Usar la base de datos
USE BDBigBeng;
GO

-- Crear la tabla Clientes
CREATE TABLE Clientes (
    id_cliente NVARCHAR(10) PRIMARY KEY,  -- PK
    nombre NVARCHAR(50),
    apellido NVARCHAR(50),
    telefono NVARCHAR(15),
    direccion NVARCHAR(100)
);
GO

-- Crear la tabla Pizzas
CREATE TABLE Pizzas (
    id_pizza NVARCHAR(10) PRIMARY KEY,  -- PK
    nombre NVARCHAR(100),
    descripcion NVARCHAR(100),
    precio DECIMAL(10, 2)
);
GO

-- Crear la tabla Empleado
CREATE TABLE Empleado (
    id_empleado NVARCHAR(10) PRIMARY KEY,  -- PK
    nombre NVARCHAR(50),
    apellido NVARCHAR(50),
    rol NVARCHAR(50),
    telefono NVARCHAR(15)
);
GO

-- Crear la tabla Pedidos
CREATE TABLE Pedidos (
    id_pedido NVARCHAR(10) PRIMARY KEY,  -- PK
    fecha_hora DATETIME DEFAULT GETDATE(),
    total DECIMAL(10, 2),
    estado NVARCHAR(50),
    id_cliente NVARCHAR(10),  -- FK
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)  -- Relación con Clientes
);
GO

-- Crear la tabla Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    id_detalle NVARCHAR(10) PRIMARY KEY,  -- PK
    id_pedido NVARCHAR(10),  -- FK
    id_pizza NVARCHAR(10),  -- FK
    cantidad INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE SET NULL,  -- Relación con Pedidos
    FOREIGN KEY (id_pizza) REFERENCES Pizzas(id_pizza) ON DELETE SET NULL     -- Relación con Pizzas
);
GO

-- Crear la tabla Entregas
CREATE TABLE Entregas (
    id_entrega NVARCHAR(10) PRIMARY KEY,  -- PK
    id_pedido NVARCHAR(10),  -- FK
    id_empleado NVARCHAR(10),  -- FK
    fecha_hora_entrega DATETIME DEFAULT GETDATE(),
    estado_entrega NVARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE SET NULL,  -- Relación con Pedidos
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)  -- Relación con Empleado
);
GO

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (id_cliente, nombre, apellido, telefono, direccion) VALUES 
('C0001', 'Diego', 'Sotelo', '987654321', 'Lima-Villa el Salvador'),
('C0002', 'Sebastian', 'Bismarck', '987654321', 'Lima-San Juan de Lurigancho'),
('C0003', 'Daniel', 'Veliz', '987654323', 'Lima-Miraflores'),
('C0004', 'Sebastian', 'Quispe', '987654324', 'Lima-San Isidro'),
('C0005', 'Henderson', 'Eguia', '987654325', 'Lima-La Molina'),
('C0006', 'Franklin', 'Mautino', '987654326', 'Lima-Surco'),
('C0007', 'Marko', 'Macedo', '978695435', 'Lima-San Juan de Lurigancho'),
('C0008', 'Romeo', 'Duran', '989765452', 'Lima-Comas'),
('C0009', 'Diego', 'Velez', '978654321', 'Lima-Ate'),
('C0010', 'Franklin', 'Diaz', '954343289', 'Lima-Santa Anita');
GO

-- Insertar datos en la tabla Pizzas
INSERT INTO Pizzas (id_pizza, nombre, descripcion, precio) VALUES
('P0001', 'Pizza Hawaiana', 'Pizza con jamón y piña', 22.50),
('P0002', 'Pizza all the meats', 'Variedad de carnes como jamón, pepperoni y tocino', 28.00),
('P0003', 'Pizza Americana con queso mozzarella y peperoni', 'Mozzarella y peperoni', 25.00),
('P0004', 'Pizza Hawaiana Chicken Barbecue', 'Pollo, piña y salsa barbacoa', 24.50),
('P0005', 'Pizza Vegetariana', 'Selección de verduras frescas', 21.00),
('P0006', 'Pizza Pepperoni', 'Clásica con pepperoni y queso', 23.00),
('P0007', 'Pizza Super Margarita', 'Tomate, mozzarella y albahaca', 19.50),
('P0008', 'Pizza Napolitana', 'Salsa de tomate, mozzarella y albahaca', 20.00),
('P0009', 'Pizza Bacon Chicken Barbecue', 'Pollo, bacon y salsa barbacoa', 26.00),
('P0010', 'Pizza Continentalle', 'Ingredientes de la gastronomía continental', 27.50),
('P0011', 'Pizza Española', 'Chorizo español, pimientos y aceitunas', 24.00),
('P0012', 'Pizza Vegana 6 Quesos', '6 tipos de queso vegano', 23.50),
('P0013', 'Pizza Fugazza', 'Cebolla caramelizada y queso', 22.00),
('P0014', 'Pizza The Works', 'Carnes, vegetales y queso', 29.00),
('P0015', 'Pizza La Favorita', 'Mezcla de ingredientes seleccionados', 25.50),
('P0016', 'Pizza Parrillera', 'Carne a la parrilla, salsa barbacoa y vegetales', 27.00),
('P0017', 'Pizza con Tocino y Queso', 'Tocino crujiente y queso', 24.00);
GO

-- Insertar datos en la tabla Empleado
INSERT INTO Empleado (id_empleado, nombre, apellido, rol, telefono) VALUES 
('E0001', 'Juan', 'Rojas', 'Motorizado', '987654322'),
('E0002', 'Pedro', 'Espinoza', 'Motorizado', '987654320'),
('E0003', 'Carlos', 'González', 'Motorizado', '987654323'),
('E0004', 'Luis', 'Martínez', 'Motorizado', '987654324'),
('E0005', 'Ana', 'Torres', 'Motorizado', '987654325'),
('E0006', 'Rosa', 'Vega', 'Motorizado', '987654326'),
('E0007', 'Juan', 'Salcedo', 'Motorizado', '987654326'),
('E0008', 'Jose', 'Ramirez', 'Motorizado', '987654326'),
('E0009', 'Rosa', 'Vergara', 'Motorizado', '987654326'),
('E0010', 'Maria', 'Quisoe', 'Motorizado', '987654326');
GO

-- Insertar datos en la tabla Pedidos
INSERT INTO Pedidos (id_pedido, fecha_hora, total, estado, id_cliente) VALUES 
('PE0001', '2024-12-12 12:30', 51.00, 'En proceso', 'C0001'),
('PE0002', '2024-12-12 13:00', 25.50, 'Cancelado', 'C0002'),
('PE0003', '2024-12-12 14:30', 45.00, 'En proceso', 'C0003'),
('PE0004', '2024-12-12 15:15', 28.50, 'En camino', 'C0004'),
('PE0005', '2024-12-12 16:00', 63.00, 'En proceso', 'C0005'),
('PE0006', '2024-12-12 17:30', 39.00, 'En proceso', 'C0006'),
('PE0007', '2024-12-12 18:00', 27.00, 'Entregado', 'C0007'),
('PE0008', '2024-12-12 19:00', 55.50, 'En camino', 'C0008'),
('PE0009', '2024-12-12 19:45', 36.00, 'En proceso', 'C0009'),
('PE0010', '2024-12-12 20:00', 51.50, 'Cancelado', 'C0010');
GO

-- Insertar datos en la tabla Detalle_Pedido
INSERT INTO Detalle_Pedido (id_detalle, id_pedido, id_pizza, cantidad) VALUES 
('DP0001', 'PE0001', 'P0001', 2),  -- Pizza Hawaiana (2 pizzas)
('DP0002', 'PE0002', 'P0002', 1),  -- Pizza All the Meats (1 pizza)
('DP0003', 'PE0003', 'P0003', 2),  -- Pizza Americana con Queso Mozzarella y Peperoni (2 pizzas)
('DP0004', 'PE0004', 'P0004', 1),  -- Pizza Hawaiana Chicken Barbecue (1 pizza)
('DP0005', 'PE0005', 'P0005', 3),  -- Pizza Vegetariana (3 pizzas)
('DP0006', 'PE0006', 'P0006', 2),  -- Pizza Pepperoni (2 pizzas)
('DP0007', 'PE0007', 'P0007', 1),  -- Pizza Super Margarita (1 pizza)
('DP0008', 'PE0008', 'P0008', 2),  -- Pizza Napolitana (2 pizzas)
('DP0009', 'PE0009', 'P0009', 1),  -- Pizza Bacon Pizza Chicken Barbecue (1 pizza)
('DP0010', 'PE0010', 'P0010', 2);  -- Pizza Continentalle (2 pizzas)
GO

-- Insertar datos en la tabla Entregas
INSERT INTO Entregas (id_entrega, id_pedido, id_empleado, fecha_hora_entrega, estado_entrega) VALUES 
('EN0001', 'PE0001', 'E0001', '2024-12-12 14:00', 'Entregado'),
('EN0002', 'PE0002', 'E0002', '2024-12-12 14:30', 'En camino'),
('EN0003', 'PE0003', 'E0003', '2024-12-12 15:00', 'Entregado'),
('EN0004', 'PE0004', 'E0004', '2024-12-12 15:30', 'En camino'),
('EN0005', 'PE0005', 'E0005', '2024-12-12 16:00', 'Entregado'),
('EN0006', 'PE0006', 'E0006', '2024-12-12 16:30', 'En proceso'),
('EN0007', 'PE0007', 'E0007', '2024-12-12 17:00', 'Entregado'),
('EN0008', 'PE0008', 'E0008', '2024-12-12 17:30', 'En camino'),
('EN0009', 'PE0009', 'E0009', '2024-12-12 18:00', 'Cancelado'),
('EN0010', 'PE0010', 'E0010', '2024-12-12 18:30', 'Entregado');
GO

----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
-- Crear Cliente
CREATE PROCEDURE sp_InsertarCliente
    @id_cliente NVARCHAR(10),
    @nombre NVARCHAR(50),
    @apellido NVARCHAR(50),
    @telefono NVARCHAR(15),
    @direccion NVARCHAR(100)
AS
BEGIN
    INSERT INTO Clientes (id_cliente, nombre, apellido, telefono, direccion)
    VALUES (@id_cliente, @nombre, @apellido, @telefono, @direccion);
END;
GO

-- Leer Cliente por ID
CREATE PROCEDURE sp_ObtenerClientePorID
    @id_cliente NVARCHAR(10)
AS
BEGIN
    SELECT * FROM Clientes WHERE id_cliente = @id_cliente;
END;
GO

-- Actualizar Cliente
CREATE PROCEDURE sp_ActualizarCliente
    @id_cliente NVARCHAR(10),
    @nombre NVARCHAR(50),
    @apellido NVARCHAR(50),
    @telefono NVARCHAR(15),
    @direccion NVARCHAR(100)
AS
BEGIN
    UPDATE Clientes
    SET nombre = @nombre, apellido = @apellido, telefono = @telefono, direccion = @direccion
    WHERE id_cliente = @id_cliente;
END;
GO

-- Listar Cliente
CREATE PROCEDURE sp_ListarClientes
AS
BEGIN
    SELECT id_cliente, nombre, apellido, telefono, direccion
    FROM Clientes;
END;
GO

EXEC sp_ListarClientes;
----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- Crear pizza

CREATE PROCEDURE sp_InsertarPizza
    @id_pizza NVARCHAR(10),
    @nombre NVARCHAR(100),
    @descripcion NVARCHAR(100),
    @precio DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Pizzas (id_pizza, nombre, descripcion, precio)
    VALUES (@id_pizza, @nombre, @descripcion, @precio);
END;
GO

-- Leer pizza

CREATE PROCEDURE sp_ObtenerPizzaPorID
    @id_pizza NVARCHAR(10)
AS
BEGIN
    SELECT * FROM Pizzas WHERE id_pizza = @id_pizza;
END;
GO

-- Actualizar pizza

CREATE PROCEDURE sp_ActualizarPizza
    @id_pizza NVARCHAR(10),
    @nombre NVARCHAR(100),
    @descripcion NVARCHAR(100),
    @precio DECIMAL(10, 2)
AS
BEGIN
    UPDATE Pizzas
    SET nombre = @nombre, descripcion = @descripcion, precio = @precio
    WHERE id_pizza = @id_pizza;
END;
GO

-- Eliminar pizza

CREATE PROCEDURE sp_EliminarPizza
    @id_pizza NVARCHAR(10)
AS
BEGIN
    -- Eliminar pizza solo si no está en uso en otros registros
    IF NOT EXISTS (SELECT 1 FROM Detalle_Pedido WHERE id_pizza = @id_pizza)
    BEGIN
        DELETE FROM Pizzas WHERE id_pizza = @id_pizza;
    END
    ELSE
    BEGIN
        PRINT 'No se puede eliminar la pizza, ya está en un pedido';
    END
END;
GO

-- Listar pizza

CREATE PROCEDURE sp_ListarPizzas
AS
BEGIN
    SELECT id_pizza, nombre, descripcion, precio
    FROM Pizzas;
END;
GO

EXEC sp_ListarPizzas;
----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

-- Crear Empleado
CREATE PROCEDURE sp_InsertarEmpleado
    @id_empleado NVARCHAR(10),
    @nombre NVARCHAR(50),
    @apellido NVARCHAR(50),
    @rol NVARCHAR(50),
    @telefono NVARCHAR(15)
AS
BEGIN
    INSERT INTO Empleado (id_empleado, nombre, apellido, rol, telefono)
    VALUES (@id_empleado, @nombre, @apellido, @rol, @telefono);
END;
GO

-- Leer Empleado por ID
CREATE PROCEDURE sp_ObtenerEmpleadoPorID
    @id_empleado NVARCHAR(10)
AS
BEGIN
    SELECT * FROM Empleado WHERE id_empleado = @id_empleado;
END;
GO

-- Actualizar Empleado
CREATE PROCEDURE sp_ActualizarEmpleado
    @id_empleado NVARCHAR(10),
    @nombre NVARCHAR(50),
    @apellido NVARCHAR(50),
    @rol NVARCHAR(50),
    @telefono NVARCHAR(15)
AS
BEGIN
    UPDATE Empleado
    SET nombre = @nombre, apellido = @apellido, rol = @rol, telefono = @telefono
    WHERE id_empleado = @id_empleado;
END;
GO

-- Eliminar Empleado
CREATE PROCEDURE sp_EliminarEmpleado
    @id_empleado NVARCHAR(10)
AS
BEGIN
    DELETE FROM Empleado WHERE id_empleado = @id_empleado;
END;
GO

-- Listar Empleado
CREATE PROCEDURE sp_ListarEmpleado
AS
BEGIN
    SELECT id_empleado, nombre, apellido, rol, telefono
    FROM Empleado;
END;
GO

EXEC sp_ListarEmpleado;
----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- 
CREATE PROCEDURE sp_InsertarPedido
    @id_pedido NVARCHAR(10),
    @id_cliente NVARCHAR(10),
    @estado NVARCHAR(50),
    @total DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Pedidos (id_pedido, id_cliente, estado, total)
    VALUES (@id_pedido, @id_cliente, @estado, @total);
END;
GO
----------------------------------------------
--
CREATE PROCEDURE sp_InsertarDetallePedido
    @id_detalle NVARCHAR(10),
    @id_pedido NVARCHAR(10),
    @id_pizza NVARCHAR(10),
    @cantidad INT
AS
BEGIN
    INSERT INTO Detalle_Pedido (id_detalle, id_pedido, id_pizza, cantidad)
    VALUES (@id_detalle, @id_pedido, @id_pizza, @cantidad);
END;
GO
--------------------------------------------
--------------------------------------------
--
CREATE PROCEDURE sp_ActualizarPedido
    @id_pedido NVARCHAR(10),
    @estado NVARCHAR(50),
    @total DECIMAL(10, 2)
AS
BEGIN
    UPDATE Pedidos
    SET estado = @estado,
        total = @total
    WHERE id_pedido = @id_pedido;
END;
GO
--------------------------------------------
--------------------------------------------
--
CREATE PROCEDURE sp_EliminarPedido
    @id_pedido NVARCHAR(10)
AS
BEGIN
    DELETE FROM Detalle_Pedido WHERE id_pedido = @id_pedido;  
    DELETE FROM Pedidos WHERE id_pedido = @id_pedido; 
END;
GO
---------------------------------------------
CREATE PROCEDURE sp_ObtenerPedidosConDetalles
AS
BEGIN
    SELECT 
        p.id_pedido,
        p.fecha_hora,
        p.total,
        p.estado,
        c.nombre AS nombre_cliente,
        dp.id_detalle,
        dp.id_pizza,
        dp.cantidad,
        pi.nombre AS nombre_pizza,
        pi.precio AS precio_pizza
    FROM Pedidos p
    INNER JOIN Clientes c ON p.id_cliente = c.id_cliente
    INNER JOIN Detalle_Pedido dp ON p.id_pedido = dp.id_pedido
    INNER JOIN Pizzas pi ON dp.id_pizza = pi.id_pizza;
END;
GO

-------Funcion para calcular el total---------

CREATE FUNCTION fn_CalcularTotal
(
    @id_pedido NVARCHAR(10)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @total DECIMAL(10, 2);
    SELECT @total = SUM(pi.precio * dp.cantidad)
    FROM Detalle_Pedido dp
    INNER JOIN Pizzas pi ON dp.id_pizza = pi.id_pizza
    WHERE dp.id_pedido = @id_pedido;

    RETURN @total;
END;
GO
----------Automatizar el calculo total-----------
CREATE TRIGGER trg_ActualizarTotalPedido
ON Detalle_Pedido
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @id_pedido NVARCHAR(10);

    SELECT @id_pedido = id_pedido FROM inserted; -- Detectar el pedido modificado

    UPDATE Pedidos
    SET total = dbo.fn_CalcularTotal(@id_pedido)
    WHERE id_pedido = @id_pedido;
END;
GO
---------------------
CREATE PROCEDURE sp_ListarPedidos
AS
BEGIN
    SELECT
        id_pedido,
        fecha_hora,
        total,
        estado,
        id_cliente
    FROM
        Pedidos
    ORDER BY
        fecha_hora DESC; -- Puedes cambiar el orden si lo prefieres
END
GO

