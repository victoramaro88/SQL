-- SELECT DE TODAS AS TABELAS
SELECT * FROM DB_ANOTACOES.dbo.tb_aluno;
SELECT * FROM DB_ANOTACOES.dbo.tb_edital;
SELECT * FROM DB_ANOTACOES.dbo.tb_anotacao order by id desc;
SELECT * FROM DB_ANOTACOES.dbo.tb_recurso;
SELECT * FROM DB_ANOTACOES.dbo.tb_aplicativo;
SELECT * FROM DB_ANOTACOES.dbo.tb_cia;
SELECT * FROM DB_ANOTACOES.dbo.tb_pelotao;
SELECT * FROM DB_ANOTACOES.dbo.tb_conduta;
SELECT * FROM DB_ANOTACOES.dbo.tb_grupo;
SELECT * FROM DB_ANOTACOES.dbo.tb_grupo_x_direito;
SELECT * FROM DB_ANOTACOES.dbo.tb_pelotao;
SELECT * FROM DB_ANOTACOES.dbo.tb_usuario;
SELECT * FROM DB_ANOTACOES.dbo.tb_usuario_x_opm;

                                            







                                                SELECT 
	                                                Anot.id, Anot.data_hora_anotacao
	                                                , Anot.data_hora_anotacao, Anot.conduta AS condutaDesc, Anot.cod_d5_pm_inicial, ConIn.conduta AS condutaInCod
	                                                , ConIn.descricao AS condutaInDesc, Anot.ciencia, Anot.re_anotante, Anot.cargo_funcao
	                                                , Anot.cod_d5_pm_final, ConFi.conduta AS condutaFiCod, ConFi.descricao AS condutaFiDesc, Anot.email_aluno
	                                                , Anot.posto_grad_anotante, Anot.nome_anotante, Recurso.id_recurso  
                                                FROM DB_ANOTACOES.dbo.tb_anotacao Anot WITH(NOLOCK)
                                                JOIN DB_ANOTACOES.dbo.tb_aluno Aluno  WITH(NOLOCK) ON Aluno.id_pessoa = Anot.id_pessoa
                                                JOIN DB_ANOTACOES.dbo.tb_conduta ConIn WITH(NOLOCK) ON Anot.cod_d5_pm_inicial = ConIn.cod_conduta
                                                JOIN DB_ANOTACOES.dbo.tb_conduta ConFi WITH(NOLOCK) ON Anot.cod_d5_pm_final = ConFi.cod_conduta
                                                LEFT JOIN DB_ANOTACOES.dbo.tb_recurso Recurso WITH(NOLOCK) ON Recurso.id_anotacao = Anot.id
                                                WHERE Aluno.cpf = 32263773886
		                                                AND Anot.ciencia IS NULL 
		                                                AND Anot.cod_d5_pm_final > 0
                                                        ORDER BY Anot.data_hora_anotacao;
                                            




SELECT 
id_pessoa, poscod, nome, cpf, re, re_dig, cia_escola, pelotao, numero, edital, foto, celular, email, 
data_admissao, data_nascimento, cidade_nascimento, uf_nascimento, tipo_sangue, fator_rh, 
estado_civil, numero_filhos, data_casamento, nacionalidade_pai, pai, mae, sinais_particulares, cor_olhos, 
cor_cabelos, tipo_cabelos, idiomas, rg, titulo_eleitor, zona_eleitoral, secao_eleitoral, cidade_voto, 
cnh_numero, cnh_categoria, validade_cnh, cert_reservista, serie_reservista, rm_reservista, cert_dispensa, 
serie_dispensa, unidade_expedidora, categoria_dispensa, data_expedicao_dispensa, motivo_dispensa,  
oculos, nacionalidade_mae, altura, cutis, conjuge, nacionalidade_conjuge, 
carteira_profissional, carteira_serie, pis_pasep, endereco, numero_end, bloco, apto, bairro, uf, cidade, cep, 
telefone, dp, btl, cia, ponto_ref, endereco_ness, numero_end_ness, bloco_ness, apto_ness, bairro_ness, uf_ness, 
cidade_ness, cep_ness, telefone_ness, celular_ness, ponto_ref_ness, alteracao, local_domicilio_ness, latitude, 
longitude, casa_propria, veiculo, veiculo_placas, moto, moto_placas, religiao, esportes, sabe_nadar, atividade_social, 
profissao_pai, profissao_mae, profissao_conjugue, mora_com_quem, grau_relacionamento_familiares, quantidade_irmaos, pessoa_familia_com, 
conduzido_dp, motivo, doencas_graves, foi_internado, motivo_internado, servico_pm, prestou_quantas_vezes, motivo_reprovado, 
parentes_pm, grau_parentesco, apoio_familia, local_pretende_servir, bebe_socialmente, onde_bebe, drogas, qual_droga, quantas_vezes, 
qual_idade, amigos_viciados, possui_armas, tipo_numero, possui_porte, foi_ameacado, motivo_ameaca, vontade_matar, motivo_matar, 
digitador, inquerito, inquerito_motivo, nivel_superior, curso_superior, pos_graduacao, agencia, conta_tipo, conta, banco
FROM DB_ANOTACOES.dbo.tb_aluno;



                                                
                                                SELECT 
	                                                Anot.id, Anot.data_hora_anotacao
	                                                , Anot.data_hora_anotacao, Anot.conduta AS condutaDesc, Anot.cod_d5_pm_inicial, ConIn.conduta AS condutaInCod
	                                                , ConIn.descricao AS condutaInDesc, Anot.ciencia, Anot.re_anotante, Anot.cargo_funcao
	                                                , Anot.cod_d5_pm_final, ConFi.conduta AS condutaFiCod, ConFi.descricao AS condutaFiDesc, Anot.email_aluno
	                                                , Anot.posto_grad_anotante, Anot.nome_anotante 
                                                FROM DB_ANOTACOES.dbo.tb_anotacao Anot WITH(NOLOCK)
                                                JOIN DB_ANOTACOES.dbo.tb_aluno Aluno  WITH(NOLOCK) ON Aluno.id_pessoa = Anot.id_pessoa
                                                JOIN DB_ANOTACOES.dbo.tb_conduta ConIn WITH(NOLOCK) ON Anot.cod_d5_pm_inicial = ConIn.cod_conduta
                                                JOIN DB_ANOTACOES.dbo.tb_conduta ConFi WITH(NOLOCK) ON Anot.cod_d5_pm_final = ConFi.cod_conduta
                                                WHERE Aluno.cpf = '32263773886'
		                                                AND Anot.ciencia IS NULL 
		                                                AND Anot.cod_d5_pm_final > 0
                                                        ORDER BY Anot.data_hora_anotacao;
                                            
                                            
                                            
                                            
                                            


SELECT 
    Aluno.id_pessoa, PosGrad.POSSGL, Aluno.re, Aluno.re_dig, Aluno.nome, Aluno.cpf, Cia.cia, Aluno.pelotao, numero, Aluno.email, foto
FROM DB_ANOTACOES.dbo.tb_aluno Aluno
JOIN DB_ANOTACOES.dbo.tb_cia Cia ON Cia.cod_cia = Aluno.cia_escola
JOIN DB_ANOTACOES.dbo.tb_pelotao Pel ON Pel.cod_pel = Aluno.pelotao
JOIN DB_ANOTACOES.dbo.tb_edital Edi ON Edi.id_edital = Aluno.edital
JOIN DB_RHCB.SchRH.POS PosGrad ON PosGrad.POSCOD = Aluno.posCod
WHERE Edi.id_edital = 1 AND Aluno.pelotao = 10 AND Aluno.numero = 10
--WHERE cpf = '11111111111' OR re = (SELECT CAST('103200' AS INT));




USE DB_RHCB
-- Concede permissão de SELECT ao usuário W3$LOGIN para todas as tabelas existentes no banco
GRANT SELECT ON DB_RHCB.SchRH.POS TO W3$ANOTACOES;





SELECT
--	COUNT(*) AS total	
	Anot.id, Anot.cod_cia, Cia.cia, Anot.pelotao AS pelotaoCod, Pel.pelotao, Anot.numero
	, Anot.data_hora_anotacao, Anot.conduta AS condutaDesc, Anot.cod_d5_pm_inicial, ConIn.conduta AS condutaInCod
	, ConIn.descricao AS condutaInDesc, Anot.ciencia, Anot.re_anotante, Anot.cargo_funcao
	, Anot.cod_d5_pm_final, ConFi.conduta AS condutaFiCod, ConFi.descricao AS condutaFiDesc, Anot.email_aluno, Anot.posto_grad_anotante, Anot.nome_anotante
FROM DB_ANOTACOES.dbo.tb_anotacao Anot WITH(NOLOCK)
JOIN DB_ANOTACOES.dbo.tb_cia Cia WITH(NOLOCK) ON Anot.cod_cia = Cia.cod_cia
JOIN DB_ANOTACOES.dbo.tb_pelotao Pel WITH(NOLOCK) ON Anot.pelotao = Pel.cod_pel
JOIN DB_ANOTACOES.dbo.tb_conduta ConIn WITH(NOLOCK) ON Anot.cod_d5_pm_inicial = ConIn.cod_conduta
JOIN DB_ANOTACOES.dbo.tb_conduta ConFi WITH(NOLOCK) ON Anot.cod_d5_pm_final = ConFi.cod_conduta
WHERE Anot.re = 141499--103425--
 
ORDER BY Anot.data_hora_anotacao;

		AND Anot.ciencia IS NULL 
		AND Anot.cod_d5_pm_final > 0
		ORDER BY Anot.data_hora_anotacao;

SELECT
    id,
    re,
    cod_cia,
    pelotao,
    numero,
    data_hora_anotacao,
    conduta,
    cod_d5_pm_inicial,
    ciencia,
    re_anotante,
    cargo_funcao,
    re_logado,
    data_hora_cadastro
FROM
    dbo.tb_anotacao
WHERE cod_d5_pm_final = 0




SELECT id, re, cod_cia, pelotao, numero, data_hora_anotacao, conduta, cod_d5_pm_inicial, ciencia, re_anotante, cargo_funcao, re_logado, data_hora_cadastro, cod_d5_pm_final, posto_grad_aluno, nome_aluno, email_aluno, posto_grad_anotante, nome_anotante
FROM DB_ANOTACOES.dbo.tb_anotacao
where re = 141499
order by id desc
;

SELECT idAplicativo, titulo, descricao, nivel
FROM DB_ANOTACOES.dbo.tb_aplicativo;

SELECT cod_cia, cia
FROM DB_ANOTACOES.dbo.tb_cia;

SELECT cod_conduta, conduta, descricao
FROM DB_ANOTACOES.dbo.tb_conduta;

SELECT idGrupo, titulo, descricao, nivel
FROM DB_ANOTACOES.dbo.tb_grupo;

SELECT idGrupo, apl_titulo, apl_direito
FROM DB_ANOTACOES.dbo.tb_grupo_x_direito;

SELECT cod_pel, pelotao
FROM DB_ANOTACOES.dbo.tb_pelotao;

SELECT re, data_cadastro, observacoes, idGrupo, ativo
FROM DB_ANOTACOES.dbo.tb_usuario;

SELECT cod_opm, re
FROM DB_ANOTACOES.dbo.tb_usuario_x_opm;


/*
USE DB_EFETIVO
GO
GRANT SELECT ON SchEfetivo.Efetivo TO [W3$ANOTACOES];
*/