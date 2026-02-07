create database oficina;
use oficina;

-- criar tabela cliente
create table client(
    idClient int auto_increment primary key,
    name varchar(100) not null,
    phone varchar(20) not null,
    address varchar(255) not null,
    constraint unique_client_phone unique (phone)
);

-- criar tabela veiculo
create table vehicle(
    idVehicle int auto_increment primary key,
    plate varchar(10) not null,
    model varchar(100) not null,
    brand varchar(100) not null,
    year year not null,
    idClient int not null,
    constraint unique_vehicle_plate unique (plate),
    constraint fk_vehicle_client foreign key (idClient)
        references client(idClient)
        on delete cascade
        on update cascade
);

-- criar tabela mecanico
create table mechanic(
    idMechanic int auto_increment primary key,
    name varchar(100) not null,
    specialty varchar(100) not null,
    phone varchar(20) not null,
    constraint unique_mechanic_phone unique (phone)
);

-- criar tabela ordem de serviço
create table serviceOrder(
    idOrder int auto_increment primary key,
    idVehicle int not null,
    orderDate date not null default (current_date),
    status enum('Aberta','Em andamento','Finalizada','Cancelada') default 'Aberta',
    totalValue decimal(10,2) default 0,
    constraint fk_order_vehicle foreign key (idVehicle)
        references vehicle(idVehicle)
        on delete restrict
        on update cascade
);

-- criar tabela serviço
create table service(
    idService int auto_increment primary key,
    description varchar(255) not null,
    price decimal(10,2) not null,
    constraint check_service_price check (price > 0)
);

-- criar tabela peça
create table part(
    idPart int auto_increment primary key,
    name varchar(100) not null,
    price decimal(10,2) not null,
    stock int not null default 0,
    constraint unique_part_name unique (name),
    constraint check_part_price check (price > 0),
    constraint check_part_stock check (stock >= 0)
);

-- relacionamento ordem x serviço
create table orderService(
    idOrder int not null,
    idService int not null,
    quantity int not null default 1,
    primary key (idOrder, idService),
    constraint check_os_quantity check (quantity > 0),
    constraint fk_os_order foreign key (idOrder)
        references serviceOrder(idOrder)
        on delete cascade,
    constraint fk_os_service foreign key (idService)
        references service(idService)
);

-- relacionamento ordem x peça
create table orderPart(
    idOrder int not null,
    idPart int not null,
    quantity int not null default 1,
    primary key (idOrder, idPart),
    constraint check_op_quantity check (quantity > 0),
    constraint fk_op_order foreign key (idOrder)
        references serviceOrder(idOrder)
        on delete cascade,
    constraint fk_op_part foreign key (idPart)
        references part(idPart)
);

-- relacionamento ordem x mecânico
create table orderMechanic(
    idOrder int not null,
    idMechanic int not null,
    primary key (idOrder, idMechanic),
    constraint fk_om_order foreign key (idOrder)
        references serviceOrder(idOrder)
        on delete cascade,
    constraint fk_om_mechanic foreign key (idMechanic)
        references mechanic(idMechanic)
);

-- criar view para calcular valor total da ordem
create view vw_order_total as
select
    so.idOrder,
    coalesce(sum(os.quantity * s.price),0) as totalServices,
    coalesce(sum(op.quantity * p.price),0) as totalParts,
    coalesce(sum(os.quantity * s.price),0) +
    coalesce(sum(op.quantity * p.price),0) as totalOrder
from serviceOrder so
left join orderService os on so.idOrder = os.idOrder
left join service s on os.idService = s.idService
left join orderPart op on so.idOrder = op.idOrder
left join part p on op.idPart = p.idPart
group by so.idOrder;

-- criar trigger para atualizar valor total após inserir serviço
delimiter $$

create trigger trg_update_total_after_service
after insert on orderService
for each row
begin
    update serviceOrder
    set totalValue = (
        select totalOrder
        from vw_order_total
        where idOrder = new.idOrder
    )
    where idOrder = new.idOrder;
end$$

-- criar trigger para atualizar valor total após inserir peça
create trigger trg_update_total_after_part
after insert on orderPart
for each row
begin
    update serviceOrder
    set totalValue = (
        select totalOrder
        from vw_order_total
        where idOrder = new.idOrder
    )
    where idOrder = new.idOrder;
end$$

delimiter ;

show tables;