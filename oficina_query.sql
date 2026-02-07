use oficina;

-- listar todas as ordens com cliente, veículo e status
select 
    so.idOrder,
    c.name as cliente,
    v.plate,
    v.model,
    so.status,
    so.totalValue
from serviceOrder so
join vehicle v on so.idVehicle = v.idVehicle
join client c on v.idClient = c.idClient
order by so.totalValue desc;

-- total gasto por cliente
select
    c.name as cliente,
    sum(so.totalValue) as total_gasto
from client c
join vehicle v on c.idClient = v.idClient
join serviceOrder so on v.idVehicle = so.idVehicle
group by c.idClient
order by total_gasto desc;

-- clientes que gastaram mais de 1000 reais
select
    c.name,
    sum(so.totalValue) as total_gasto
from client c
join vehicle v on c.idClient = v.idClient
join serviceOrder so on v.idVehicle = so.idVehicle
group by c.idClient
having total_gasto > 1000;

-- valor total por ordem (serviços + peças)
select
    so.idOrder,
    c.name as cliente,
    sum(s.price * os.quantity) +
    sum(p.price * op.quantity) as valor_total_calculado
from serviceOrder so
join vehicle v on so.idVehicle = v.idVehicle
join client c on v.idClient = c.idClient
left join orderService os on so.idOrder = os.idOrder
left join service s on os.idService = s.idService
left join orderPart op on so.idOrder = op.idOrder
left join part p on op.idPart = p.idPart
group by so.idOrder;

-- mecânicos com maior número de ordens
select
    m.name as mecanico,
    count(om.idOrder) as total_ordens
from mechanic m
join orderMechanic om on m.idMechanic = om.idMechanic
group by m.idMechanic
order by total_ordens desc;

-- peças com estoque baixo (menor que 10)
select
    name,
    stock
from part
where stock < 10
order by stock asc;

-- serviços mais realizados
select
    s.description,
    count(os.idService) as quantidade
from service s
join orderService os on s.idService = os.idService
group by s.idService
order by quantidade desc;

-- média de valor das ordens por status
select
    status,
    avg(totalValue) as media_valor
from serviceOrder
group by status;

-- histórico completo de uma ordem
select
    so.idOrder,
    c.name as cliente,
    v.plate,
    m.name as mecanico,
    s.description as servico,
    p.name as peca,
    so.status,
    so.totalValue
from serviceOrder so
join vehicle v on so.idVehicle = v.idVehicle
join client c on v.idClient = c.idClient
left join orderMechanic om on so.idOrder = om.idOrder
left join mechanic m on om.idMechanic = m.idMechanic
left join orderService os on so.idOrder = os.idOrder
left join service s on os.idService = s.idService
left join orderPart op on so.idOrder = op.idOrder
left join part p on op.idPart = p.idPart
order by so.idOrder;