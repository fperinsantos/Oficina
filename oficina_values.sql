-- inserir clientes
insert into client (name, phone, address) values
('João Silva', '11999990001', 'Rua A, São Paulo - SP'),
('Maria Santos', '21999990002', 'Av B, Rio de Janeiro - RJ'),
('Pedro Oliveira', '31999990003', 'Rua C, Belo Horizonte - MG'),
('Ana Costa', '41999990004', 'Av D, Curitiba - PR'),
('Carlos Pereira', '51999990005', 'Rua E, Porto Alegre - RS'),
('Fernanda Lima', '11999990006', 'Rua F, São Paulo - SP');

-- inserir veículos
insert into vehicle (plate, model, brand, year, idClient) values
('ABC1A23', 'Corolla', 'Toyota', 2019, 1),
('DEF2B34', 'Civic', 'Honda', 2021, 1),
('GHI3C45', 'Gol', 'Volkswagen', 2016, 2),
('JKL4D56', 'Onix', 'Chevrolet', 2020, 3),
('MNO5E67', 'Argo', 'Fiat', 2022, 4),
('PQR6F78', 'HB20', 'Hyundai', 2018, 5),
('STU7G89', 'Compass', 'Jeep', 2023, 6);

-- inserir mecânicos
insert into mechanic (name, specialty, phone) values
('Carlos Souza', 'Motor', '11988880001'),
('André Lima', 'Suspensão', '21988880002'),
('Bruno Rocha', 'Elétrica', '31988880003'),
('Felipe Santos', 'Freios', '41988880004'),
('Rafael Nunes', 'Geral', '51988880005');

-- inserir serviços
insert into service (description, price) values
('Troca de óleo', 150.00),
('Alinhamento e balanceamento', 180.00),
('Revisão elétrica', 250.00),
('Troca de pastilhas de freio', 300.00),
('Revisão completa', 800.00),
('Troca de embreagem', 1200.00);

-- inserir peças
insert into part (name, price, stock) values
('Filtro de óleo', 45.00, 100),
('Pastilha de freio', 180.00, 60),
('Bateria 60Ah', 450.00, 25),
('Correia dentada', 220.00, 40),
('Velas de ignição', 35.00, 200),
('Embreagem completa', 950.00, 15);

-- inserir ordens de serviço
insert into serviceOrder (idVehicle, orderDate, status) values
(1, '2026-01-10', 'Finalizada'),
(2, '2026-01-12', 'Em andamento'),
(3, '2026-01-15', 'Finalizada'),
(4, '2026-01-18', 'Aberta'),
(5, '2026-01-20', 'Finalizada'),
(6, '2026-01-22', 'Em andamento'),
(7, '2026-01-25', 'Aberta');

-- inserir serviços nas ordens
insert into orderService (idOrder, idService, quantity) values
(1, 1, 1),
(1, 2, 1),
(2, 4, 1),
(3, 3, 1),
(3, 5, 1),
(4, 1, 1),
(5, 4, 2),
(5, 2, 1),
(6, 6, 1),
(7, 3, 1);

-- inserir peças nas ordens
insert into orderPart (idOrder, idPart, quantity) values
(1, 1, 1),
(1, 5, 4),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 2, 2),
(5, 1, 1),
(6, 6, 1),
(7, 3, 1);

-- inserir mecânicos nas ordens
insert into orderMechanic (idOrder, idMechanic) values
(1, 1),
(1, 2),
(2, 4),
(3, 3),
(4, 1),
(5, 5),
(6, 2),
(7, 3);