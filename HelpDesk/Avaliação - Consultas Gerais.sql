SELECT ChamadoIdf, PesIdf, ChamadoDt, PrioridadeIdf, CategoriaIdf, SubCategoriaIdf, StatusAtendIdf, ChamadoaAtv
FROM DB_HELPDESK_CB.dbo.Chamado
order by ChamadoIdf desc;


SELECT TipoQuestaoIdf, TipoQuestaoDesc, TipoQuestaoAtv
FROM DB_HELPDESK_CB.dbo.TipoQuestao;

SELECT RespostaIdf, RespostaDesc, RespostaPeso, RespostaAtv
FROM DB_HELPDESK_CB.dbo.Resposta;

SELECT QuestaoIdf, QuestaoDesc, QuestaoPeso, TipoQuestaoIdf, QuestaoAtv
FROM DB_HELPDESK_CB.dbo.Questao;

SELECT QuestaoIdf, RespostaIdf, QuestaoRespostaOrd
FROM DB_HELPDESK_CB.dbo.QuestaoResposta;

SELECT QuestionarioIdf, QuestionarioDesc, QuestionarioAtv
FROM DB_HELPDESK_CB.dbo.Questionario;

SELECT QuestaoIdf, QuestionarioIdf, QuestaoQuestionarioOrd
FROM DB_HELPDESK_CB.dbo.QuestaoQuestionario;

SELECT AvaliacaoIdf, QuestionarioIdf, ChamadoIdf
FROM DB_HELPDESK_CB.dbo.Avaliacao
--WHERE ChamadoIdf = 83;
--WHERE AvaliacaoIdf > 4

SELECT AvaliacaoIdf, QuestaoIdf, RespostaIdf, RespostaAberta
FROM DB_HELPDESK_CB.dbo.RespostaQuestionario
ORDER BY AvaliacaoIdf;




DELETE FROM DB_HELPDESK_CB.dbo.RespostaQuestionario
WHERE AvaliacaoIdf = 0
DELETE FROM DB_HELPDESK_CB.dbo.Avaliacao
WHERE AvaliacaoIdf = 0;


SELECT ModeloRespostaIdf, ModeloRespostaNome, ModeloRespostaDesc, TipRespostaIdf, ModeloRespostaAtv
FROM DB_HELPDESK_CB.dbo.ModeloResposta
--WHERE ModeloRespostaIdf = 22;

UPDATE DB_HELPDESK_CB.dbo.ModeloResposta
SET ModeloRespostaDesc=''
WHERE ModeloRespostaIdf=0;

--> SELECT PARA RETORNO DO QUESTIONÁRIO
SELECT 
QUE.QuestaoAtv,
	QST.QuestionarioIdf, QST.QuestionarioDesc
	, QUE.QuestaoIdf, QUE.QuestaoDesc, QUE.QuestaoPeso, QUE.TipoQuestaoIdf
	, RES.RespostaIdf, RES.RespostaDesc, RES.RespostaPeso
	, QQ.QuestaoQuestionarioOrd, QR.QuestaoRespostaOrd
FROM DB_HELPDESK_CB.dbo.Questionario QST 
JOIN DB_HELPDESK_CB.dbo.QuestaoQuestionario QQ ON QST.QuestionarioIdf = QQ.QuestionarioIdf
JOIN DB_HELPDESK_CB.dbo.Questao QUE ON QQ.QuestaoIdf = QUE.QuestaoIdf
LEFT JOIN DB_HELPDESK_CB.dbo.QuestaoResposta QR ON QUE.QuestaoIdf = QR.QuestaoIdf 
LEFT JOIN DB_HELPDESK_CB.dbo.Resposta RES ON QR.RespostaIdf = RES.RespostaIdf
WHERE 
	QST.QuestionarioIdf = 1
	AND QST.QuestionarioAtv = 1
	AND QUE.QuestaoAtv = 1
	AND (RES.RespostaAtv = 1 OR RES.RespostaAtv IS NULL)
ORDER BY QQ.QuestaoQuestionarioOrd ASC, QR.QuestaoRespostaOrd ASC



--
SELECT ModeloRespostaIdf, ModeloRespostaNome, ModeloRespostaDesc, TipRespostaIdf, ModeloRespostaAtv
FROM DB_HELPDESK_CB.dbo.ModeloResposta;


