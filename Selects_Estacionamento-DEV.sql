SELECT 
        cto.opm as codopm
        ,cto.cartao as cartao
        ,cto.valcartao as validade
        ,cad.posto as posto
        ,cad.nome as nome
        ,cad.unidadesecao as unidadesecao
        ,cad.ramal as ramal
        ,cto.marcamodelo as modelo
        ,cto.placa as placa
        ,cto.municipio as cidade
        ,cto.uf as estado
        ,cto.cor as cor
        ,loc.loc as localest
        ,cto.dataemissao as emissao
        ,cto.emissornome as nomeemissor
        ,cto.emissorposto as postoemissor
        ,cad.unidadesecao as opmnome
        ,cad.unidadesecao as secao
        ,est.nome_opm as estacionamento
    FROM Estacionamento.dbo.cadastro AS cad 
    JOIN Estacionamento.dbo.cartao AS cto ON cad.re=cto.re 
    JOIN Estacionamento.dbo.localestacionamento as loc ON loc.id=cto.local 
    JOIN Estacionamento.dbo.opm_estacionamento as est ON cto.opm=est.cod_opm
    WHERE cto.re=141499
    
SELECT cartao, placa, re, marcamodelo, cor, ano, municipio, uf, chassi, renavan, [local], das, has, valcartao, exercicio, dataregistro, dataemissao, emissornome, fiscalizadornome, emissorposto, fiscalizadorposto, obs, tipoveiculo, disp, opm, opmnome, unidadesecao, localestacionamento, log, ssma$rowid
FROM Estacionamento.dbo.cartao;

SELECT re, opm, unidadesecao, ramal, cnh, validade, posto, nome, log, cpf, ssma$rowid
FROM Estacionamento.dbo.cadastro;



