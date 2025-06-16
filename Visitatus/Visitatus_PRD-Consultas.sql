SELECT sesCodi, sesDesc, sesDtHr, sesLibe, sesStat, lojCodi, graCodi, tiSCodi, sesNume, sesNome
FROM DB_Visitatus.dbo.Sessao;

SELECT usuCodi, sesCodi, preAtiv, lojCodi, preEmai
FROM DB_Visitatus.dbo.Presenca
WHERE lojcodi = 26 --sesCodi = 9;

SELECT 
	*
FROM DB_Visitatus.dbo.Presenca PRE
JOIN DB_Visitatus.dbo.Usuario USR ON PRE.usuCodi = USR.usuCodi
WHERE PRE.sesCodi = 9
--ORDER BY USR.usuCodi
;

SELECT 
	*
FROM DB_Visitatus.dbo.PerfilUsuario PU
join DB_Visitatus.dbo.Usuario U ON U.usucodi = PU.usucodi
--where U.usuNCIM = '353124'
--where PU.lojCodi in (25, 26)

SELECT	* FROM DB_Visitatus.dbo.Loja

--where lojNumL = '3479'
where lojCodi in (25, 26)


SELECT * FROM DB_Visitatus.dbo.Usuario;
SELECT * FROM DB_Visitatus.dbo.Perfil Perf;
SELECT * FROM DB_Visitatus.dbo.Permissao Perm;
SELECT * FROM DB_Visitatus.dbo.PermissaoPerfil PP;
SELECT * FROM DB_Visitatus.dbo.PerfilUsuario PU;
--where PU.perCodi = 1
--order by peUCodi;



--> CONSULTAR O USUÁRIO NA TELA DE CADASTRO
SELECT 
	Usr.usuCodi, Usr.usuNome, Usr.usuNasc, Usr.usuEmai, Usr.usuNCel, Usr.usuStat, 
	Loj.lojCodi, Loj.lojNome, Loj.lojNumL,
	Perf.perCodi, Perf.perNome, Perf.perStat 
FROM DB_Visitatus.dbo.Usuario Usr
JOIN DB_Visitatus.dbo.PerfilUsuario PerUsu ON Usr.usuCodi = PerUsu.usuCodi 
JOIN DB_Visitatus.dbo.Loja Loj ON PerUsu.lojCodi = Loj.lojCodi 
JOIN DB_Visitatus.dbo.Perfil Perf ON PerUsu.perCodi = Perf.perCodi
WHERE Usr.usuNCIM = 320097 AND Loj.potCodi = 5
ORDER BY Loj.lojNome 


-----------------------------------------------------------------------------------------------------------
--> SELECT PARA RETORNAR AS INFORMAÇÕES DOS CERTIFICADOS DE PRESENÇAS DOS IRMÃOS.

SELECT 
	Loj.lojNome, Loj.lojNumL,
	Pot.potSigl, Pot.potNome,
	Ses.sesDtHr,
	Cid.cidNome,
	Est.estSigl,
	Loj.lojLogo,
	Pot.potLogo
FROM DB_Visitatus.dbo.Sessao Ses
JOIN DB_Visitatus.dbo.Loja Loj ON Loj.lojCodi = Ses.lojCodi
JOIN DB_Visitatus.dbo.Potencia Pot ON Pot.potCodi = Loj.potCodi 
JOIN DB_Visitatus.dbo.Cidade Cid ON Cid.cidCodi = Loj.cidCodi 
JOIN DB_Visitatus.dbo.Estado Est ON Est.estCodi = Cid.estCodi 
WHERE Ses.sesCodi = 4;

SELECT 
	Usu.usuCodi, Usu.usuNome, 
	Loj.lojNome, Loj.lojNumL
FROM DB_Visitatus.dbo.Presenca Pre
JOIN DB_Visitatus.dbo.Usuario Usu ON Usu.usuCodi = Pre.usuCodi
JOIN DB_Visitatus.dbo.Loja Loj ON Loj.lojCodi = Pre.lojCodi  
JOIN DB_Visitatus.dbo.Sessao Ses ON Ses.sesCodi = Pre.sesCodi
JOIN DB_Visitatus.dbo.TipoSessao Tip ON Tip.tiSCodi = Ses.tiSCodi 
WHERE Pre.sesCodi = 4;

--> SELECT PARA CONFIRMAÇÃO DE PRESENÇA DA SESSÃO:
SELECT 
	Usu.usuCodi, Usu.usuNome, Usu.usuNCIM,
	Loj.lojNome, Loj.lojNumL,
	Pre.preAtiv 
	--
	, PU.perCodi 
FROM DB_Visitatus.dbo.Presenca Pre
JOIN DB_Visitatus.dbo.Usuario Usu ON Usu.usuCodi = Pre.usuCodi
JOIN DB_Visitatus.dbo.Loja Loj ON Loj.lojCodi = Pre.lojCodi  
JOIN DB_Visitatus.dbo.Sessao Ses ON Ses.sesCodi = Pre.sesCodi
--
JOIN DB_Visitatus.dbo.PerfilUsuario PU ON PU.usuCodi = Pre.usuCodi
WHERE Pre.sesCodi = 2 AND PU.perCodi = 4;

-----------------------------------------------------------------------------------------------------------
--> TEMPLATES DE CONVITES

SELECT tmpCvtCodi, tmpCvtNome, tmpCvtMode, tmpCvtStat
FROM DB_Visitatus.dbo.TemplateConvite;

UPDATE DB_Visitatus.dbo.TemplateConvite
SET tmpCvtMode = N'<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Convite ARLS 14 Bis</title>
  <style>
    * {
      box-sizing: border-box;
    }

    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
    }

    .container {
      position: relative;
      width: 100%;
      max-width: 566px; /* largura real da imagem */
      aspect-ratio: 566 / 800; /* mantém a proporção original */
      background: url(''./img/Fundo.png'') no-repeat center top;
      background-size: contain;
      margin: 0 auto;
      padding-top: 230px;
      padding-bottom: 170px;
      padding-left: 80px;
      padding-right: 80px;
    }

    .conteudo {
      position: relative;
      width: 100%;
      height: 100%;
      padding: 10px;
      border-radius: 8px;
    }

    @media (max-width: 600px) {
      .container {
        padding-top: 160px;
        padding-bottom: 120px;
        padding-left: 60px;
        padding-right: 60px;
      }

      .conteudo {
        padding: 10px;
        font-size: 12px;
      }
    }
  </style>
</head>
<body>

  <div class="container">
    <div class="conteudo">
      <p style="text-align: center;">
        O Ven.''. Mest.''. da A.''. R.''. L.''. S.''. 14 Bis, nº 4064 
        convoca todos os IIr.''. do Quad.''. de OObr.''. e
        tem a honra de convidar os demais IIr.''. para a
        Sess.''. Mag.''. de Exaltação do Ir.''.:
      </p>
      <p style="text-align: center;">
        <b>Frank Itinoce</b>
      </p>
      <p style="text-align: center; padding-bottom: 10px;">
        a ser realizada no dia 23/04/2025, às 20h no
        Templo Situado na
        Rua Dr. Rodrigo de Barros, 127
        Luz - São Paulo / SP
      </p>
      <p style="text-align: center;">
        Necessário confirmar presença clicando no botão abaixo:
      </p>
      <div style="text-align: center;">
        <button id="confirmar-presenca-btn"
            style="border-radius: 12px; background-color: green; color: white; padding: 7px 17px; border: none; cursor: pointer;">
            Confirmar Presença
        </button>
      </div>
      <p style="text-align: center;">
        Iliucha Garcia Valle
        <br>
        <small>Venerável Mestre</small>
      </p>
    </div>
  </div>

</body>
</html>'
WHERE tmpCvtCodi = 0;

SELECT tmpCvtCodi, lojCodi, tmpLjStat
FROM DB_Visitatus.dbo.TemplateLoja;

UPDATE DB_Visitatus.dbo.TemplateConvite
SET tmpCvtMode=''
WHERE tmpCvtCodi=0;

SELECT * FROM DB_Visitatus.dbo.Presenca order by usuCodi desc;
SELECT * FROM DB_Visitatus.dbo.Usuario order by usuCodi desc; --WHERE usuCodi = 32; --CIM marcinho 246836
SELECT * FROM DB_Visitatus.dbo.Loja;
SELECT * FROM DB_Visitatus.dbo.PerfilUsuario --WHERE usuCodi = 1;--32;
--order by peUCodi desc
order by usuCodi desc

SELECT 
	--* 
	Usr.usuCodi, Usr.usuNome, Usr.usuNCIM, Usr.usuEmai
	, Per.perNome
	, Loj.lojCodi, Loj.lojNome 
FROM DB_Visitatus.dbo.Usuario Usr
JOIN DB_Visitatus.dbo.PerfilUsuario Perf ON Usr.usuCodi = Perf.usuCodi
JOIN DB_Visitatus.dbo.Perfil Per ON Perf.perCodi = Per.perCodi 
JOIN DB_Visitatus.dbo.Loja Loj ON Perf.lojCodi = Loj.lojCodi 
--ORDER BY Usr.usuNome
ORDER BY Usr.usuCodi DESC 

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario
WHERE usuCodi = 50
AND lojCodi = 1

SELECT * FROM DB_Visitatus.dbo.Usuario Usr
WHERE Usr.usuCodi = 50

SELECT * FROM DB_Visitatus.dbo.Perfil Per

SELECT * FROM DB_Visitatus.dbo.Presenca p 
-----------------------------------------------------------------------------------------------------------
--> TEMPLATES DE CERTIFICADOS

SELECT tmpCrtPreCodi, tmpCrtPreNome, tmpCrtPreMode, tmpCrtPreStat
FROM DB_Visitatus.dbo.TemplateCertificadoPresenca;

UPDATE DB_Visitatus.dbo.TemplateCertificadoPresenca
SET tmpCrtPreMode=''
WHERE tmpCrtPreCodi=;


SELECT tmpCrtPreCodi, lojCodi, tmpCrtStat
FROM DB_Visitatus.dbo.TemplateCertificadoLoja;

-----------------------------------------------------------------------------------------------------------
--GESTÃO DOS CARGOS ADMINISTRATIVOS:

SELECT * FROM DB_Visitatus.dbo.Cargos;

SELECT * FROM DB_Visitatus.dbo.CargosRito;

SELECT * FROM DB_Visitatus.dbo.GestaoCargos; --USR: 2

SELECT * FROM DB_Visitatus.dbo.Usuario;

SELECT * FROM DB_Visitatus.dbo.GestaoAdministrativa;


SELECT * FROM DB_Visitatus.dbo.Sessao;

-- SELECT PARA TRAZER OS OFICIAIS DA GESTÃO ADMINISTRATIVA
SELECT
	L.lojCodi, L.lojNome, L.lojNumL,
	GA.gstAdmNome, GA.gstAdmDtIn, GA.gstAdmDtFi, GA.gstAdmStat,
	C.carNome, U.usuNome
FROM DB_Visitatus.dbo.Loja L
JOIN DB_Visitatus.dbo.GestaoAdministrativa GA ON GA.lojCodi = L.lojCodi
JOIN DB_Visitatus.dbo.GestaoCargos GC ON GC.gstAdmCodi = GA.gstAdmCodi
JOIN DB_Visitatus.dbo.Cargos C ON C.carCodi = GC.carCodi 
JOIN DB_Visitatus.dbo.Usuario U ON U.usuCodi = GC.usuCodi 
WHERE L.lojCodi = 1
	AND GA.gstAdmStat = 1
	AND (GA.gstAdmDtIn <= CAST(GETDATE() AS DATE) AND GA.gstAdmDtFi >= CAST(GETDATE() AS DATE))
ORDER BY GA.gstAdmDtFi DESC

-----------------------------------------------------------------------------------------------------------

SELECT ritCodi, ritNome, ritLogo, ritStat
FROM DB_Visitatus.dbo.Rito;

SELECT potCodi, potNome, potLogo, potRegu, potStat, potSigl
FROM DB_Visitatus.dbo.Potencia;

SELECT perCodi, perNome, perStat
FROM DB_Visitatus.dbo.Perfil;

SELECT pemCodi, pemNome, pemStat
FROM DB_Visitatus.dbo.Permissao;

SELECT graCodi, graNome, graStat
FROM DB_Visitatus.dbo.Grau;

SELECT tiSCodi, tiSNome, tiSStat
FROM DB_Visitatus.dbo.TipoSessao;

SELECT *
FROM DB_Visitatus.dbo.PerfilUsuario;

SELECT lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi
FROM DB_Visitatus.dbo.Loja;

SELECT sesCodi, sesNume, sesDtHr, sesNome, sesDesc, lojCodi, tiSCodi, graCodi, sesLibe, sesStat
FROM DB_Visitatus.dbo.Sessao;

-----------------------------------------------------------------------------------------------------------

SELECT sesCodi, sesDesc, sesDtHr, sesLibe, sesStat, lojCodi, graCodi, tiSCodi, sesNume, sesNome
FROM DB_Visitatus.dbo.Sessao;

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario WHERE usuCodi = 47

SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus.dbo.Usuario;

SELECT usLCodi, usLUser, usLPass, usLStat, usuCodi
FROM DB_Visitatus.dbo.UsuarioLogin;

SELECT lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi
FROM DB_Visitatus.dbo.Loja;

SELECT gstAdmCodi, carCodi, usuCodi, gstCarStat
FROM DB_Visitatus.dbo.GestaoCargos;

SELECT gstAdmCodi, gstAdmNome, gstAdmDtIn, gstAdmDtFi, gstAdmStat, lojCodi
FROM DB_Visitatus.dbo.GestaoAdministrativa;

SELECT usuCodi, sesCodi, preAtiv, lojCodi, preEmai
FROM DB_Visitatus.dbo.Presenca;

SELECT perCodi, perNome, perStat
FROM DB_Visitatus.dbo.Perfil;

SELECT pemCodi, pemNome, pemStat
FROM DB_Visitatus.dbo.Permissao;

SELECT perCodi, pemCodi, papAtvo, pepStat
FROM DB_Visitatus.dbo.PermissaoPerfil;





SELECT *
FROM DB_Visitatus.dbo.PerfilUsuario
WHERE usuCodi IN (1, 4)
;

--> CONSULTA DE LISTA DE PRESENÇA DE UMA SESSÃO:
DECLARE @lojCodi BIGINT
SET @lojCodi = (SELECT lojCodi FROM DB_Visitatus.dbo.Sessao WHERE sesCodi = 4)
SELECT
    pre.SesCodi, usu.UsuCodi, usu.UsuNome, usu.UsuNcim, loj.LojCodi, loj.LojNome, loj.LojNumL, pre.PreAtiv, pre.PreEmai,
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM DB_Visitatus.dbo.Presenca pre_sub
            JOIN DB_Visitatus.dbo.Usuario usu_sub ON pre_sub.usuCodi = usu_sub.usuCodi
            JOIN DB_Visitatus.dbo.PerfilUsuario per_sub ON usu_sub.usuCodi = per_sub.usuCodi
            WHERE 
                per_sub.perCodi = 4 --> Perfil "Membro"
                AND pre_sub.lojCodi = @lojCodi --> Id da Loja
                AND pre_sub.usuCodi = pre.usuCodi
        ) THEN 1
        ELSE 0
    END AS MembroLoja
FROM DB_Visitatus.dbo.Presenca pre
INNER JOIN DB_Visitatus.dbo.Usuario usu ON pre.usuCodi = usu.usuCodi
INNER JOIN DB_Visitatus.dbo.Loja loj ON pre.lojCodi = loj.lojCodi 
INNER JOIN DB_Visitatus.dbo.Sessao ses ON pre.sesCodi = ses.sesCodi
INNER JOIN DB_Visitatus.dbo.PerfilUsuario per ON usu.usuCodi = per.usuCodi
WHERE 
    pre.sesCodi = 4 --> Id da Sessão
    AND per.PerCodi = 4 --> Perfil "Membro"
ORDER BY MembroLoja, usu.usuNome;

SELECT * FROM DB_Visitatus.dbo.Sessao

SELECT * FROM DB_Visitatus.dbo.Usuario

SELECT * FROM DB_Visitatus.dbo.Loja

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario

SELECT * FROM DB_Visitatus.dbo.Perfil

SELECT * FROM DB_Visitatus.dbo.Presenca



SELECT 
	U.usuCodi, U.usuNome, U.usuNCIM, U.usuNCel, U.usuEmai, U.usuNasc, U.usuStat,
	P.perCodi, P.perNome
	, PU.peUStat
FROM DB_Visitatus.dbo.PerfilUsuario PU
JOIN DB_Visitatus.dbo.Perfil P ON P.perCodi = PU.perCodi 
JOIN DB_Visitatus.dbo.Loja L ON L.lojCodi = PU.lojCodi 
JOIN DB_Visitatus.dbo.Usuario U ON U.usuCodi = PU.usuCodi
WHERE L.lojCodi = 1
ORDER BY U.usuNome 


SELECT 
	P.perCodi, P.perNome, P.perStat 
	, PR.pemCodi, PR.pemNome, PR.pemStat 
	, PP.papAtvo, PP.pepStat 
FROM DB_Visitatus.dbo.PermissaoPerfil PP
JOIN DB_Visitatus.dbo.Perfil P ON P.perCodi = PP.perCodi
JOIN DB_Visitatus.dbo.Permissao PR ON PR.pemCodi = PP.pemCodi
WHERE P.perCodi = 337;


-- SELECT DAS INFORMAÇÕES DAS SESSÕES
SELECT 
	S.sesCodi, S.sesNume, S.sesNome, S.sesDesc, S.sesDtHr, S.sesLibe, S.sesStat,
	TS.tiSNome,	G.graNome, 
	L.lojCodi, L.lojNome, L.lojStat, L.lojNume, L.lojLogr, L.lojNumL, L.lojBair,
	P.potNome, P.potSigl, P.potRegu,
	R.ritNome,
	C.cidNome, E.estSigl,
	L.lojLogo,
	P.potLogo
FROM DB_Visitatus.dbo.Sessao S
JOIN DB_Visitatus.dbo.Grau G ON G.graCodi = S.graCodi 
JOIN DB_Visitatus.dbo.TipoSessao TS ON TS.tiSCodi = S.tiSCodi 
JOIN DB_Visitatus.dbo.Loja L ON L.lojCodi = S.lojCodi
JOIN DB_Visitatus.dbo.Potencia P ON P.potCodi = L.potCodi
JOIN DB_Visitatus.dbo.Rito R ON R.ritCodi = L.ritCodi 
JOIN DB_Visitatus.dbo.Cidade C ON C.cidCodi = L.cidCodi 
JOIN DB_Visitatus.dbo.Estado E ON E.estCodi = C.estCodi
WHERE S.sesCodi = 4
--WHERE S.sesLibe = 1 AND L.lojCodi = 1
--ORDER BY S.sesCodi DESC



SELECT 
	lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi 
FROM DB_Visitatus.dbo.Loja
WHERE lojNumL = '4024' AND potCodi = 5


SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus.dbo.Usuario;

SELECT sesCodi, sesDesc, sesDtHr, sesLibe, sesStat, lojCodi, graCodi, tiSCodi, sesNume, sesNome
FROM DB_Visitatus.dbo.Sessao;


SELECT perCodi, perNome, perStat
FROM DB_Visitatus.dbo.Perfil;

--==============================================================================================================================
-- CONFIGURAÇÕES RELACIONADAS À PRESENÇA

SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus.dbo.Usuario;

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario
WHERE usuCodi = 4
--WHERE lojCodi >2
;

SELECT * FROM DB_Visitatus.dbo.Loja
--WHERE lojCodi >2
;

SELECT * FROM DB_Visitatus.dbo.Presenca;

--==============================================================================================================================

-- CONFIGURAÇÕES RELACIONADAS AOS USUÁRIOS DE UMA LOJA ESPECÍFICA

SELECT * FROM DB_Visitatus.dbo.Loja L;

SELECT 	* FROM DB_Visitatus.dbo.Perfil P;

SELECT 	* FROM DB_Visitatus.dbo.Usuario;

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario;

SELECT 
	PU.peUCodi,
	L.lojCodi, L.lojNome, L.lojNumL,
	U.usuCodi, U.usuNome,
	P.perCodi, P.perNome 
FROM DB_Visitatus.dbo.PerfilUsuario PU
JOIN DB_Visitatus.dbo.Usuario U ON U.usuCodi = PU.usuCodi
JOIN DB_Visitatus.dbo.Loja L ON L.lojCodi = PU.lojCodi 
JOIN DB_Visitatus.dbo.Perfil P ON P.perCodi = PU.perCodi
ORDER BY L.lojNome, U.usuNome
--ORDER BY PU.peUCodi DESC
;

SELECT 
	*
FROM DB_Visitatus.dbo.Usuario U
JOIN DB_Visitatus.dbo.PerfilUsuario PU ON PU.usuCodi = U.usuCodi
WHERE PU.lojCodi = 1
;


--==============================================================================================================================


SELECT tmpCrtPreCodi, tmpCrtPreNome, tmpCrtPreMode, tmpCrtPreStat
FROM DB_Visitatus.dbo.TemplateCertificadoPresenca;

SELECT tmpCrtPreCodi, lojCodi, tmpCrtStat
FROM DB_Visitatus.dbo.TemplateCertificadoLoja;

SELECT * FROM DB_Visitatus.dbo.CargosRito;