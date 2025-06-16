SELECT TOP(1000)
	--*
	--count(*)
	CONTROLE.idcontrole, CONTROLE.cartao,CONTROLE.placa, CONTROLE.tipoveiculo, CONTROLE.entradadata, CONTROLE.posto 
	, CONTROLE.condutor, CONTROLE.sentinela, CONTROLE.destino, CONTROLE.obs, CONTROLE.oficial, CONTROLE.adjunto, CONTROLE.recondutor
	, CARTAO.valcartao, CARTAO.opm 
	, OPMESTACIONAMENTO.nome_opm 
FROM Estacionamento.dbo.controle AS CONTROLE
LEFT JOIN Estacionamento.dbo.cartao AS CARTAO ON CARTAO.placa  = CONTROLE.placa 
LEFT JOIN Estacionamento.dbo.rgavulso AS RGAVULSO ON RGAVULSO.placa  = CONTROLE.placa 
LEFT JOIN Estacionamento.dbo.opm_estacionamento AS OPMESTACIONAMENTO ON OPMESTACIONAMENTO.cod_opm = CARTAO.opm 
WHERE CONTROLE.opm = 700000000 -- CONTROLE.placa = 'GHC3D47'--saidadata is null --and CONTROLE.placa = 'GHC3D47'--CONTROLE.opm = 700000000
ORDER BY CONTROLE.entradadata DESC 
;


SELECT cartao, placa, re, marcamodelo, cor, ano, municipio, uf, chassi, renavan, [local], das, has, valcartao, exercicio, dataregistro, dataemissao, emissornome, fiscalizadornome, emissorposto, fiscalizadorposto, obs, tipoveiculo, disp, opm, opmnome, unidadesecao, localestacionamento, log, ssma$rowid
FROM Estacionamento.dbo.cartao
WHERE placa = 'QBN4669';
--WHERE placa = 'bza1340';

SELECT re, opm, unidadesecao, ramal, cnh, validade, posto, nome, log, cpf, ssma$rowid
FROM Estacionamento.dbo.cadastro
WHERE re = 22118891822
;

SELECT * from Estacionamento.dbo.controle AS CONTROLE
WHERE placa = 'GHC3D47'
ORDER BY entradadata DESC ;