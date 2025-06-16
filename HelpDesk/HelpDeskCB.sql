








SELECT * FROM DB_HELPDESK_CB.dbo.Chamado
WHERE ChamadoIdf = 05815

SELECT TipCategoriaIdf, TipCategoriaDesc, TipCategoriaAtv
FROM DB_HELPDESK_CB.dbo.TipCategoria;

SELECT CategoriaIdf, CategoriaDesc, TipCategoriaIdf, CategoriaAtv
FROM DB_HELPDESK_CB.dbo.Categoria
--WHERE TipCategoriaIdf IN (45)--(2,3)
order by CategoriaIdf desc  
;

/*
INSERT INTO DB_HELPDESK_CB.dbo.Categoria
(CategoriaIdf, CategoriaDesc, TipCategoriaIdf, CategoriaAtv)
VALUES
(45, 'ESB - INFORMÁTICA', 10, 1),
(46, 'ESB - PREFEITURA', 10, 1)
;
*/

SELECT SubCategoriaIdf, SubCategoriaDesc, SubCategoriaAtv
FROM DB_HELPDESK_CB.dbo.SubCategoria
--WHERE SubCategoriaDesc LIKE '%Talão%'
order by SubCategoriaIdf desc;


SELECT CategoriaIdf, SubCategoriaIdf
FROM DB_HELPDESK_CB.dbo.CategoriaSubCategoria
where CategoriaIdf = 45;

--==========================================================================================================================================================================
--> MANUTENÇÃO DE ENDEREÇOS, TELEFONES E E-MAILS DAS UNIDADES (UOR)

--> CONSULTA UOR
SELECT
	*
	--UorCod, OrgCod, OrgNivCod, UorNom, UorAreGeo, UorAtvIdc, UorSglNom, UorRegOprDat, PesIdf, PosCod, UorPesRegOprCod, RegOprTipCod, UorOpmIdc, UorAreCor, UorIpRegOprNum, UorMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UOR
WHERE UorCod = 51;

--> CONSULTA VIEW UOR
SELECT
	*
	--UorCCB, UorCCBNome, UorCCBOOpmCOD, UorCM, UorCMNome, UorCMOOpmCOD, UorSubCM, UorSubCMNome, UorSubCMOpmCOD, UorGBCM, UorGBNome, UorGBOpmCOD, UorSGBCM, UorSGBNome, UorSGBOpmCOD, UorPTCM, UorPTNome, UorPTOpmCOD, UorBaseCM, UorBaseNome, UorBaseOpmCOD, UorGpCM, UorGpNome, UorGpOpmCOD, UorDirCM, UorDirNome, UorDirOpmCOD, UorDepCM, UorDepNome, UorDepOpmCOD, UorDivCM, UorDivNome, UorDivOpmCOD, UorScaCM, UorScaNome, UorScaOpmCOD, UorSTACM, UorSTANome, UorSTAOpmCOD, UorPLCM, UorPLNome, UorPLOpmCOD, UorEBCM, UorEBNome, UorEBOpmCOD, UorNucleoCM, UorNucleoNome, UorNucleoOpmCOD, UorCPCM, UorCPNome, UorCPOpmCOD, UorSecCM, UorSecNome, UorSecOpmCOD, UorCentCM, UorCentNome, UorCentOpmCOD, UorAgCM, UorAgNome, UorAgOpmCOD, UorGabCM, UorGabNome, UorGabOpmCOD, UorConCM, UorConNome, UorConOpmCOD, UorEmCM, UorEmNome, UorEmOpmCOD, UorBOMCM, UorBOMNome, UorBOMOpmCOD, UorPOMCM, UorPOMNome, UorPOMOpmCOD, UorSACM, UorSANome, UorSAOpmCOD, UorBCACM, UorBCANome, UorBCAOpmCOD, UorOpmCod, UorOpmNome, Uor, UorNome, UorOpm, OrgNiv, UorOpmAtvIdc, UorOpmIdc
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
WHERE uor = 51;

--> RELAÇÃO DOS PRÉDIOS CADASTRADOS
SELECT PdoCod, PdoNom, PdoAtvIdc, PdoRegOprDat, PesIdf, PosCod, UorCod, RegOprTipCod, PdoIpRegOprNum, PdoMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.PDO;

-- CADASTRO DOS ENDEREÇOS
SELECT UorEndFisCod, EndTipCod, MunCod, CttTipCod, UorEndFisEndDes, UorEndFisBaiNom, UorEndFisNum, UorEndFisPtoGeo, UorEndFisCep, UorEndFisAtvIdc, UorEndFisRegOprDat, PesIdf, PosCod, UorCod, RegOprTipCod, UorEndFisIpRegOprNum, UorEndFisMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UORENDFIS -- PdoCod == 1: CCB / ==2: CSM/MOPB
;

--RELACIONAMENTO ENDEREÇO/PRÉDIO E COMPLEMENTO
SELECT UorEndFisPdoIdf, PdoCod, UorCod, UorEndFisCod, UorEndFisPdoCplEndDes, UorEndFisPdoAtvIdc, UorEndFisPdoRegOprDat, PesIdf, PosCod, UorEndFisPdoUorRegOprCod, RegOprTipCod, UorEndFisPdoIpRegOprNum, UorEndFisPdoMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UORENDFISPDO
WHERE UorCod = 51
;

--> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--> IMPLEMENTAR ESSA QUERY EM UM SERVIÇO PARA O RETORNO DAS INFORMAÇÕES NO ENVIO DE E-MAIL.
--> TUDO JUNTO
SELECT DISTINCT
	-- PESSOA
	Efetivo.POS_GRAD, Efetivo.NOME
	-- DADOS UOR
	, UOR.UorCod, VW.UorOpmNome,
	(SELECT UorNom FROM DB_MUNICIPIO_OPM.SchUOR.UOR WHERE UorCod = VW.UorOpmCod) AS UorSupNom
	, UOR.UorNom
	-- ENDEREÇO
	, EndFis.UorEndFisEndDes, EndFis.UorEndFisNum, EndFis.UorEndFisBaiNom
	, EndePdo.UorEndFisPdoCplEndDes, EndFis.UorEndFisCep
	, EndFis.MunCod, Mun.MunNom, Mun.UfCod, Uf.UfSlg 
	-- E-MAIL
	, Email.UorCttEmaDes
	-- TELEFONE
	, Tel.UorCttTelDddNum, Tel.UorCttTelNum, Tel.UorCttTelRamNum
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ VW
JOIN DB_MUNICIPIO_OPM.SchUOR.UOR UOR ON VW.Uor = UOR.UorCod
LEFT JOIN DB_MUNICIPIO_OPM.SchUOR.UORENDFISPDO EndePdo ON EndePdo.UorCod = UOR.UorCod
LEFT JOIN DB_MUNICIPIO_OPM.SchUOR.UORENDFIS EndFis ON EndFis.UorEndFisCod = EndePdo.UorEndFisCod
LEFT JOIN DB_MUNICIPIO_OPM.dbo.MUN Mun ON EndFis.MunCod = Mun.MunCod 
LEFT JOIN DB_MUNICIPIO_OPM.dbo.UF Uf ON Mun.UfCod = Uf.UfCod 
LEFT JOIN DB_MUNICIPIO_OPM.SchUOR.UORCTTEMA Email ON UOR.UorCod = Email.UorCod
LEFT JOIN DB_MUNICIPIO_OPM.SchUOR.UORCTTTEL Tel ON UOR.UorCod = Tel.UorCod 
LEFT JOIN DB_MUNICIPIO_OPM.SchUOR.UOROPM UorOpm ON UOR.UorCod = UorOpm.UorCod
LEFT JOIN DB_EFETIVO.SchEfetivo.RHCB Efetivo ON Efetivo.OPM_ATUAL = UorOpm.OpmCod
WHERE Efetivo.CPF = '32263773886'
	  AND UorOpm.UorOpmAtvIdc = 1;


--> NOME DA UNIDADE
SELECT DISTINCT
	UOR.UorCod,
	VW.UorOpmCod,
	VW.UorOpmNome,
	(SELECT UorNom FROM DB_MUNICIPIO_OPM.SchUOR.UOR WHERE UorCod = VW.UorOpmCod) AS UorSupNom,
	UOR.UorNom
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ VW
JOIN DB_MUNICIPIO_OPM.SchUOR.UOR UOR ON VW.Uor = UOR.UorCod
WHERE UOR.UorCod = 51
	AND VW.UorOpmAtvIdc = 1;

--> CONSULTA DE ENDEREÇO DA UOR
SELECT 
	--*
	EndFis.UorEndFisEndDes, EndFis.UorEndFisNum, EndFis.UorEndFisBaiNom
	, EndePdo.UorEndFisPdoCplEndDes, EndFis.UorEndFisCep
	, EndFis.MunCod
	, Mun.MunNom, Mun.UfCod
	, Uf.UfSlg 
FROM DB_MUNICIPIO_OPM.SchUOR.UORENDFISPDO EndePdo
JOIN DB_MUNICIPIO_OPM.SchUOR.UORENDFIS EndFis ON EndFis.UorEndFisCod = EndePdo.UorEndFisCod
JOIN DB_MUNICIPIO_OPM.dbo.MUN Mun ON EndFis.MunCod = Mun.MunCod 
JOIN DB_MUNICIPIO_OPM.dbo.UF Uf ON Mun.UfCod = Uf.UfCod 
WHERE EndePdo.UorCod = 51;

--> CONSULTA DO E-MAIL
SELECT
	*
	--Email.UorCttEmaCod , Email.UorCttEmaDes, Email.UorCttEmaAtvIdc
FROM DB_MUNICIPIO_OPM.SchUOR.UORCTTEMA Email
WHERE Email.UorCod = 51;

--> CONSULTA DO TELEFONE
SELECT
	*
	--Tel.UorCttTelCod, Tel.UorCttTelDddNum, Tel.UorCttTelNum, Tel.UorCttTelRamNum, Tel.UorCttTelAtvIdc
FROM DB_MUNICIPIO_OPM.SchUOR.UORCTTTEL Tel
--WHERE Tel.UorCod = 51;

--> UORS QUE UTILIZAM O HELP DESK CB.
SELECT DISTINCT
	UorCod, VW.UorNome 
FROM DB_HELPDESK_CB.dbo.CategoriaUor CatUor
JOIN DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ VW ON VW.Uor = CatUor.UorCod;

--> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--==========================================================================================================================================================================
--> SELECT PARA RETORNAR OS CHAMADOS PARA ENCERRAMENTO SEM INTERAÇÃO:

WITH PrioridadeEmail AS (
    SELECT 
        Email.CttPfIdf,
        Email.EmaPfDes,
        ROW_NUMBER() OVER (
            PARTITION BY Email.CttPfIdf 
            ORDER BY 
                CASE 
                    WHEN Email.EmaPfDes LIKE '%@policiamilitar.sp.gov.br%' THEN 1
                    ELSE 2 
                END
        ) AS RowNum
    FROM DB_CORP_CCB.SchCRPCCB.EMAPF Email
)
SELECT
    Cha.ChamadoIdf,
    CONCAT('CCB', YEAR(GETDATE()), Cha.ChamadoIdf) AS idChamado,
    Cha.ChamadoDt,
    ISNULL(Efetivo.POS_GRAD, 'CIVIL') AS posGrad,
    Pessoa.PESNOM AS pesNom,
    Cat.CategoriaDesc,
    SC.SubCategoriaDesc,
    CM.ChamadoMensDt,
    Email.EmaPfDes
FROM DB_HELPDESK_CB.dbo.Chamado Cha
JOIN DB_HELPDESK_CB.dbo.ChamadoMens CM ON Cha.ChamadoIdf = CM.ChamadoIdf
JOIN DB_HELPDESK_CB.dbo.Categoria Cat ON Cat.CategoriaIdf = Cha.CategoriaIdf
JOIN DB_HELPDESK_CB.dbo.SubCategoria SC ON SC.SubCategoriaIdf = Cha.SubCategoriaIdf
JOIN DB_CORP_CCB.SchCRPCCB.CTTPF Ctt ON Ctt.PesIdf = Cha.PesIdf AND Ctt.CttTipCod = 2 --E-mail Apenas
JOIN DB_CORP_CCB.SchCRPCCB.PES Pessoa ON Pessoa.PesIdf = Cha.PesIdf
JOIN DB_CORP_CCB.SchCRPCCB.DOCPF Doc ON Doc.PesIdf = Pessoa.PesIdf AND Doc.DocTipPFCod = 1
LEFT JOIN DB_EFETIVO.SchEfetivo.Efetivo Efetivo ON Efetivo.CPF = Doc.DocPfNum
JOIN PrioridadeEmail Email ON Email.CttPfIdf = Ctt.CttPfIdf AND Email.RowNum = 1
WHERE 
    CM.ChamadoMensDt = (
        SELECT MAX(ChamadoMensDt)
        FROM DB_HELPDESK_CB.dbo.ChamadoMens
        WHERE ChamadoIdf = Cha.ChamadoIdf
    )
    AND StatusAtendIdf = 4
    --AND ChamadoMensDt <= (SELECT DATEADD(DAY, -10, GETDATE()))
ORDER BY Cha.ChamadoIdf;

--==========================================================================================================================================================================
--> SELECT PARA MOSTRAR TODOS OS CHAMADOS QUE FORAM ENCERRADOS SEM INTERAÇÃO DO SOLICITANTE

SELECT 
	Cha.ChamadoIdf, Cha.ChamadoDt, Cha.PesIdf,
	ISNULL(EFE.POS_GRAD, 'CIVIL') AS posGrad,
	PES.PesNom,
	Pri.PrioridadeDesc,
	TipCat.TipCategoriaDesc,
	Cat.CategoriaDesc,
	SubCat.SubCategoriaDesc,
	Hist.ChamadoHistDt 
FROM DB_HELPDESK_CB.dbo.Chamado Cha
JOIN DB_HELPDESK_CB.dbo.Categoria Cat ON Cat.CategoriaIdf = Cha.CategoriaIdf
JOIN DB_HELPDESK_CB.dbo.Prioridade Pri ON Pri.PrioridadeIdf = Cha.PrioridadeIdf
JOIN DB_HELPDESK_CB.dbo.TipCategoria TipCat ON TipCat.TipCategoriaIdf = Cat.TipCategoriaIdf 
JOIN DB_HELPDESK_CB.dbo.SubCategoria SubCat ON SubCat.SubCategoriaIdf = Cha.SubCategoriaIdf 
JOIN DB_HELPDESK_CB.dbo.ChamadoHist Hist ON Hist.ChamadoIdf = Cha.ChamadoIdf AND Hist.ModeloRespostaIdf = 21 --Modelo de resposta: Finalizado sem interação
JOIN DB_CORP_CCB.SchCRPCCB.PES PES ON PES.PesIdf = Cha.PesIdf
INNER JOIN DB_CORP_CCB.SchCRPCCB.DOCPF DOCPF ON DOCPF.PesIdf = PES.PesIdf AND DOCPF.DocTipPFCod = 1
LEFT JOIN DB_EFETIVO.SchEfetivo.Efetivo EFE ON EFE.CPF = DOCPF.DocPfNum
WHERE Cha.StatusAtendIdf = 8
ORDER By Hist.ChamadoHistDt DESC

--==========================================================================================================================================================================


                                          
--==========================================================================================================================================================================                                                

DECLARE @uorCod BIGINT
SET @uorCod = 0
DECLARE @pesIdf BIGINT
SET @pesIdf = 153927
SELECT 
	CHA.ChamadoIdf, CHA.ChamadoDt, CHA.CategoriaIdf AS catChamado
	, TRF.ChamadoIdf AS ChamadoIdfTRF, TRF.CategoriaIdf AS CategoriaIdfTRF
	--, CIVIL.PesIdf 
	, CAT.CategoriaDesc
	, CATTRF.CategoriaDesc AS CategoriaDescTRF
FROM DB_HELPDESK_CB.dbo.Chamado CHA
INNER JOIN DB_HELPDESK_CB.dbo.Categoria CAT WITH(NOLOCK) ON CAT.CategoriaIdf = CHA.CategoriaIdf
LEFT JOIN DB_HELPDESK_CB.dbo.ChamadoTransf TRF ON TRF.ChamadoIdf = CHA.ChamadoIdf
LEFT JOIN DB_HELPDESK_CB.dbo.Categoria CATTRF WITH(NOLOCK) ON CATTRF.CategoriaIdf = TRF.CategoriaIdf
LEFT JOIN DB_HELPDESK_CB.dbo.AtendenteCivil CIVIL WITH(NOLOCK) ON CIVIL.CategoriaIdf = CHA.CategoriaIdf --AND CHA.CategoriaIdf = TRF.CategoriaIdf
LEFT JOIN DB_HELPDESK_CB.dbo.CategoriaUor AS CATUOR WITH(NOLOCK) ON CATUOR.CategoriaIdf = CAT.CategoriaIdf
WHERE (CATUOR.UorCod = @uorCod OR CHA.CategoriaIdf IN (SELECT CategoriaIdf FROM DB_HELPDESK_CB.dbo.AtendenteCivil WHERE PesIdf = @pesIdf))
;

-- TODOS CHAMADOS PENDENTES
SELECT 
	CHA.ChamadoIdf, CHA.ChamadoDt,
	ISNULL(EFE.POS_GRAD, 'CIVIL') AS posGrad,
	PES.PesNom,
	TC.TipCategoriaDesc,
	C.CategoriaDesc, SC.SubCategoriaDesc,
	P.PrioridadeDesc,
	SA.StatusAtendDesc,
	TRF.ChamadoTransfIdf, TRF.ChamadoTransfDt, 
	TCTrf.TipCategoriaDesc AS TipCategoriaDescTRF,
	CatTrf.CategoriaDesc AS CategoriaDescTRF, SubCatTrf.SubCategoriaDesc AS SubCategoriaDescTRF 
FROM DB_HELPDESK_CB.dbo.Chamado CHA
JOIN DB_HELPDESK_CB.dbo.Prioridade P ON P.PrioridadeIdf = CHA.PrioridadeIdf 
JOIN DB_HELPDESK_CB.dbo.Categoria C ON C.CategoriaIdf = CHA.CategoriaIdf 
JOIN DB_HELPDESK_CB.dbo.SubCategoria SC ON SC.SubCategoriaIdf = CHA.SubCategoriaIdf 
JOIN DB_HELPDESK_CB.dbo.TipCategoria TC ON TC.TipCategoriaIdf = C.TipCategoriaIdf
JOIN DB_HELPDESK_CB.dbo.StatusAtend SA ON SA.StatusAtendIdf = CHA.StatusAtendIdf
JOIN DB_CORP_CCB.SchCRPCCB.PES PES ON PES.PesIdf = CHA.PesIdf 
INNER JOIN DB_CORP_CCB.SchCRPCCB.DOCPF DOCPF ON DOCPF.PesIdf = PES.PesIdf AND DOCPF.DocTipPFCod = 1
LEFT JOIN DB_EFETIVO.SchEfetivo.Efetivo EFE ON EFE.CPF = DOCPF.DocPfNum
LEFT JOIN DB_HELPDESK_CB.dbo.ChamadoTransf TRF ON TRF.ChamadoIdf = CHA.ChamadoIdf AND TRF.ChamadoTransfAtv = 1
LEFT JOIN DB_HELPDESK_CB.dbo.Categoria CatTrf ON CatTrf.CategoriaIdf = TRF.CategoriaIdf
LEFT JOIN DB_HELPDESK_CB.dbo.TipCategoria TCTrf ON TCTrf.TipCategoriaIdf = CatTrf.TipCategoriaIdf 
LEFT JOIN DB_HELPDESK_CB.dbo.SubCategoria SubCatTrf ON SubCatTrf.SubCategoriaIdf = TRF.SubCategoriaIdf 
WHERE CAST(CHA.ChamadoDt AS DATE) >= '2024-11-20' AND CAST(CHA.ChamadoDt AS DATE) <= '2024-11-21'
ORDER BY TC.TipCategoriaDesc ASC, CHA.ChamadoDt ASC


SELECT 
	*
FROM DB_EFETIVO.SchEfetivo.Efetivo EFE WITH(NOLOCK)
WHERE RE = 103425--191883--
   

-- PERMISSÃO DE DELETE PARA USUÁRIO EM TABELA
USE DB_HELPDESK_CB
GRANT DELETE ON DB_HELPDESK_CB.dbo.AtendenteCivil TO W3$HELPDESKCB;


SELECT CategoriaIdf, CategoriaDesc, TipCategoriaIdf, CategoriaAtv
FROM DB_HELPDESK_CB.dbo.Categoria;

SELECT SubCategoriaIdf, SubCategoriaDesc, SubCategoriaAtv
FROM DB_HELPDESK_CB.dbo.SubCategoria;

SELECT PrioridadeIdf, PrioridadeDesc, PrioridadeAtv
FROM DB_HELPDESK_CB.dbo.Prioridade;

SELECT StatusAtendIdf, StatusAtendDesc, StatusAtendAtv
FROM DB_HELPDESK_CB.dbo.StatusAtend;

SELECT CategoriaRespostaIdf, CategoriaRespostaHab, CategoriaIdf, CategoriaRespostaAtv, ModeloRespostaIdf
FROM DB_HELPDESK_CB.dbo.CategoriaResposta;

SELECT ModeloRespostaIdf, ModeloRespostaNome, ModeloRespostaDesc, TipRespostaIdf, ModeloRespostaAtv
FROM DB_HELPDESK_CB.dbo.ModeloResposta;

-- MODELO DE E-MAIL DE ABERTURA DE CHAMADO
UPDATE DB_HELPDESK_CB.dbo.ModeloResposta
SET ModeloRespostaDesc='<table width="100%" cellpadding="0" cellspacing="0" border="0" style="font-family: Arial, sans-serif; color: #333;">
    <tr>
        <td align="center" style="padding: 20px;">
            <table width="600" cellpadding="0" cellspacing="0" border="0" style="max-width:600px; width:100%; background-color:#f9f9f9; padding: 20px; border:1px solid #ddd;">
                <tr>
                    <td style="font-family: Arial, sans-serif; font-size: 16px; color: #333;">
                        <p>Olá, [nomePessoa]</p>
                        <p>Seu chamado foi aberto, e o número é: 
                            <span style="color: red; font-size: large; font-weight: bolder;">[numeroChamado]</span>
                        </p>
                        <p>Aguarde o retorno dos atendentes para a resolução de seu problema.</p>
                        <p>Qualquer necessidade, estamos à disposição.</p>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding: 20px 0;">
                            <tr>
                                <td width="70px" valign="top">
                                    <img alt="Brasão CB" width="70px" style="display:block;" src="data:image/png;base64,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">
                                </td>
                                <td valign="top" style="padding-left: 10px;">
                                    <small style="font-family: Arial, sans-serif; font-size: 12px; color: #333;">
                                        <strong>DivTIC - Divisão de Tecnologia da Informação e Comunicação.</strong>
                                        <br>
                                        Praça Clóvis Beviláqua, 421 - Sé, São Paulo - SP
                                        <br>
                                        <strong>Telefone: </strong> (11) 3396-2008
                                        <br>
                                        <strong>E-mail: </strong>
                                        <a href="mailto:ccbdivtel@policiamilitar.sp.gov.br" style="color:#007bff; text-decoration:none;">ccbdivtel@policiamilitar.sp.gov.br</a>
                                    </small>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
'
WHERE ModeloRespostaIdf=0;

-- MODELO DE E-MAIL DE RESPOSTA DE CHAMADO
UPDATE DB_HELPDESK_CB.dbo.ModeloResposta
SET ModeloRespostaDesc='<table width="100%" cellpadding="0" cellspacing="0" border="0" style="font-family: Arial, sans-serif; color: #333;">
    <tr>
        <td align="center" style="padding: 20px;">
            <table width="600" cellpadding="0" cellspacing="0" border="0" style="max-width:600px; width:100%; background-color:#f9f9f9; padding: 20px; border:1px solid #ddd;">
                <tr>
                    <td style="font-family: Arial, sans-serif; font-size: 16px; color: #333;">
                        <p>Olá, [nomePessoa]</p>
                        <p>Seu chamado de número
                            <span style="color: red; font-size: large; font-weight: bolder;">[numeroChamado]</span>
                             foi <b>[tipoAtendimento]</b> com a mensagem:
                        </p>
                        <p><small><i>"[MensagemResposta]"</i></small></p>
                        <p>Acesse o sistema para mais detalhes e interações.</p>
                        <p>Qualquer necessidade, estamos à disposição.</p>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding: 20px 0;">
                            <tr>
                                <td width="70px" valign="top">
                                    <img alt="Brasão CB" width="70px" style="display:block;" src="data:image/png;base64,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">
                                </td>
                                <td valign="top" style="padding-left: 10px;">
                                    <small style="font-family: Arial, sans-serif; font-size: 12px; color: #333;">
                                        <strong>DivTIC - Divisão de Tecnologia da Informação e Comunicação.</strong>
                                        <br>
                                        Praça Clóvis Beviláqua, 421 - Sé, São Paulo - SP
                                        <br>
                                        <strong>Telefone: </strong> (11) 3396-2008
                                        <br>
                                        <strong>E-mail: </strong>
                                        <a href="mailto:ccbdivtel@policiamilitar.sp.gov.br" style="color:#007bff; text-decoration:none;">ccbdivtel@policiamilitar.sp.gov.br</a>
                                    </small>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
'
WHERE ModeloRespostaIdf=0;


SELECT EfetivoIdf, CPF, POSCOD, POS_GRAD, RE, DIG, NOME, NOME_GUERRA, SLGCOD, SITUACAO, SEXO, QDRCOD, QDR, OPMCOD_EFETIVA, OPM_NOME_EFETIVA, OPMCOD_ATUAL, OPM_NOME_ATUAL, OPMCOD_ANTERIOR, OPM_NOME_ANTERIOR, GRD_CMD, BTL, CIA, UORCOD, UOR, DATA_INGRESSO, DATA_POSSE, EST_CVL, ESCOLARIDADE, RELIGIAO, DATA_NASC, CNH, VAL_CNH, CAT_CNH, CELULAR, TEL_FUNCIONAL, EMAIL_FUNCIONAL, EMAIL_PARTICULAR, CODBCO, BANCO, AGENCIA, CONTA, DGT_CONT, ALTURA, TIP_SANG, FTR_SANG, CUTIS, TIP_CBL, COR_CBL, NIVEL, ALMAN, DATA_ULT_PROM
FROM DB_EFETIVO.SchEfetivo.Efetivo
WHERE CPF = '39516468888';


SELECT
	--*
	CATUOR.CategoriaIdf
	,CAT.CategoriaDesc 
	,DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ UOR
	--CategoriaIdf, UorCod
FROM DB_HELPDESK_CB.dbo.CategoriaUor CATUOR
INNER JOIN DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ UOR ON UOR.Uor = CATUOR.UorCod
INNER JOIN DB_HELPDESK_CB.dbo.Categoria CAT ON CAT.CategoriaIdf = CATUOR.CategoriaIdf
;

SELECT 
	*
FROM DB_HELPDESK_CB.dbo.Categoria CAT
WHERE CategoriaDesc LIKE '%ibm not%'

----------------------------------------------------------------------------------------------------------------------

-- SELECT ATENDENTES CIVIS
SELECT DISTINCT 
    CIVIL.PesIdf, DOCPF.DocPfNum, PES.PesNom, CIVIL.AtendenteCivilAtv
FROM DB_HELPDESK_CB.dbo.AtendenteCivil CIVIL WITH(NOLOCK)
INNER JOIN DB_CORP_CCB.SchCRPCCB.PES PES WITH(NOLOCK) ON PES.PesIdf = CIVIL.PesIdf
INNER JOIN DB_CORP_CCB.SchCRPCCB.DOCPF DOCPF WITH(NOLOCK) ON DOCPF.PesIdf = PES.PesIdf
WHERE DOCPF.DocTipPfCod = 1
--GROUP BY CIVIL.PesIdf, PES.PesNom, DOCPF.DocPfNum, CIVIL.AtendenteCivilAtv

/* --------------------------------------------------------------------------- */

--CONTATOS DO SOLICITANTE
SELECT 
	CTTPF.PesIdf,
	CTTPF.CttPfIdf, CTTPF.CttTipCod
	, EMAPF.EmaPfIdf, EMAPF.EmaPfDes
	, TELPF.TelPfIdf, TELPF.TelPfDddNum, TELPF.TelPfTelNum
FROM DB_CORP_CCB.SchCRPCCB.CTTPF AS CTTPF
LEFT JOIN DB_CORP_CCB.SchCRPCCB.EMAPF AS EMAPF ON EMAPF.CttPfIdf = CTTPF.CttPfIdf
LEFT JOIN DB_CORP_CCB.SchCRPCCB.TELPF AS TELPF ON TELPF.CttPfIdf = CTTPF.CttPfIdf AND TELPF.TelTipCod = 2
WHERE CTTPF.PesIdf in (3163)--(106720, 3163)
	AND (EMAPF.EmaPfIdf IS NOT NULL OR TELPF.TelPfIdf IS NOT NULL)
ORDER BY CTTPF.CttPfIdf

-- RETORNANDO A RESPOSTA MODELO POR CATEGORIA
SELECT 
	CATRESP.CategoriaRespostaIdf , CATRESP.CategoriaRespostaHab, CATRESP.CategoriaIdf,
	MODRESP.ModeloRespostaIdf, MODRESP.ModeloRespostaAtv, MODRESP.ModeloRespostaNome, MODRESP.ModeloRespostaDesc,
	CATRESP.CategoriaRespostaAtv
FROM DB_HELPDESK_CB.dbo.CategoriaResposta AS CATRESP
INNER JOIN DB_HELPDESK_CB.dbo.ModeloResposta AS MODRESP ON MODRESP.ModeloRespostaIdf = CATRESP.ModeloRespostaIdf
INNER JOIN DB_HELPDESK_CB.dbo.Categoria AS CAT ON CAT.CategoriaIdf = CATRESP.CategoriaIdf 
WHERE --CATRESP.CategoriaIdf = 36 AND
	 MODRESP.TipRespostaIdf = 4 --AND CATRESP.CategoriaRespostaAtv = 1 AND MODRESP.ModeloRespostaAtv = 1
;


/* --------------------------------------------------------------------------- */
-- TABELAS DOMÍNIO

SELECT PrioridadeIdf, PrioridadeDesc, PrioridadeAtv
FROM DB_HELPDESK_CB.dbo.Prioridade;

SELECT CategoriaIdf, CategoriaDesc, TipCategoriaIdf, CategoriaAtv
FROM DB_HELPDESK_CB.dbo.Categoria;

SELECT SubCategoriaIdf, SubCategoriaDesc, SubCategoriaAtv
FROM DB_HELPDESK_CB.dbo.SubCategoria;

SELECT TipCategoriaIdf, TipCategoriaDesc, TipCategoriaAtv
FROM DB_HELPDESK_CB.dbo.TipCategoria
ORDER BY TipCategoriaDesc;

SELECT StatusAtendIdf, StatusAtendDesc, StatusAtendAtv
FROM DB_HELPDESK_CB.dbo.StatusAtend;

SELECT TipMensChamadoIdf, TipMensChamadoDesc, TipMensChamadoAtv
FROM DB_HELPDESK_CB.dbo.TipMensChamado;

SELECT TipRespostaIdf, TipRespostaDesc, TipRespostaAtv
FROM DB_HELPDESK_CB.dbo.TipResposta;

SELECT ModeloRespostaIdf, ModeloRespostaNome, ModeloRespostaDesc, TipRespostaIdf, ModeloRespostaAtv
FROM DB_HELPDESK_CB.dbo.ModeloResposta;

/* --------------------------------------------------------------------------- */

-- CATEGORIA / SUBCATEGORIA

SELECT 
	--*
	TC.TipCategoriaDesc
	, C.CategoriaIdf, C.CategoriaDesc
	, SC.SubCategoriaIdf, SC.SubCategoriaDesc
FROM DB_HELPDESK_CB.dbo.Categoria C
JOIN DB_HELPDESK_CB.dbo.CategoriaSubCategoria CSC ON CSC.CategoriaIdf = C.CategoriaIdf 
JOIN DB_HELPDESK_CB.dbo.SubCategoria SC ON SC.SubCategoriaIdf = CSC.SubCategoriaIdf
JOIN DB_HELPDESK_CB.dbo.TipCategoria TC ON TC.TipCategoriaIdf = C.TipCategoriaIdf 
--WHERE C.CategoriaDesc LIKE '%intrago%'
ORDER BY TC.TipCategoriaIdf 

SELECT * FROM DB_HELPDESK_CB.dbo.CategoriaSubCategoria
--WHERE CategoriaIdf = 20 --AND SubCategoriaIdf = 77 
--WHERE SubCategoriaIdf IN (123, 124)

SELECT * FROM DB_HELPDESK_CB.dbo.Categoria
--WHERE CategoriaIdf = 20
--WHERE CategoriaDesc LIKE '%Zello%'

SELECT * FROM DB_HELPDESK_CB.dbo.SubCategoria
--WHERE SubCategoriaIdf = 77
--WHERE SubCategoriaDesc LIKE '%OUTR%'
--WHERE SubCategoriaDesc LIKE '%SENH%'

SELECT * FROM DB_HELPDESK_CB.dbo.ChamadoTransf
WHERE SubCategoriaIdf = 73



/* --------------------------------------------------------------------------- */

SELECT CategoriaIdf, SubCategoriaIdf
FROM DB_HELPDESK_CB.dbo.CategoriaSubCategoria;

SELECT CategoriaIdf, CategoriaDesc, TipCategoriaIdf, CategoriaAtv
FROM DB_HELPDESK_CB.dbo.Categoria;

SELECT ModeloRespostaIdf, ModeloRespostaNome, ModeloRespostaDesc, TipRespostaIdf, ModeloRespostaAtv
FROM DB_HELPDESK_CB.dbo.ModeloResposta;

SELECT CategoriaRespostaIdf, CategoriaRespostaHab, CategoriaIdf, CategoriaRespostaAtv, ModeloRespostaIdf
FROM DB_HELPDESK_CB.dbo.CategoriaResposta;

SELECT SubCategoriaRespostaIdf, SubCategoriaRespostaHab, SubCategoriaIdf, SubCategoriaRespostaAtv, ModeloRespostaIdf
FROM DB_HELPDESK_CB.dbo.SubCategoriaResposta;

SELECT SubCategoriaIdf, SubCategoriaDesc, SubCategoriaAtv
FROM DB_HELPDESK_CB.dbo.SubCategoria
--WHERE SubCategoriaDesc LIKE '%DU%';

SELECT CategoriaIdf, CategoriaDesc, TipCategoriaIdf, CategoriaAtv
FROM DB_HELPDESK_CB.dbo.Categoria
--WHERE CategoriaDesc LIKE '%comput%';

SELECT * FROM DB_HELPDESK_CB.dbo.ModeloResposta

UPDATE DB_HELPDESK_CB.dbo.ModeloResposta
SET ModeloRespostaDesc='Dúvida: 
Se possível, ilustrar a dúvida anexando uma captura de tela.


Telefone para contato: 
Caso seja necessário esclarecer a dúvida via fone.'
WHERE ModeloRespostaIdf = 0;
















