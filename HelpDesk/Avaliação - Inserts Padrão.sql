INSERT INTO DB_HELPDESK_CB.dbo.TipoQuestao (TipoQuestaoIdf, TipoQuestaoDesc, TipoQuestaoAtv)
VALUES 
(1, 'Aberta', 1),
(2, 'Fechada', 1);


INSERT INTO DB_HELPDESK_CB.dbo.Resposta (RespostaIdf, RespostaDesc, RespostaPeso, RespostaAtv)
VALUES 
(1, 'Muito satisfeito', 5, 1),
(2, 'Satisfeito', 4, 1),
(3, 'Neutro', 3, 1),
(4, 'Insatisfeito', 2, 1),
(5, 'Muito insatisfeito', 1, 1);


INSERT INTO DB_HELPDESK_CB.dbo.Questao (QuestaoIdf, QuestaoDesc, QuestaoPeso, TipoQuestaoIdf, QuestaoAtv)
VALUES 
(1, 'O tempo de resposta para o seu chamado foi adequado?', 1, 2, 1),
(2, 'O atendente demonstrou cordialidade e profissionalismo durante o atendimento?', 1, 2, 1),
(3, 'O serviço foi realizado dentro do prazo esperado?', 1, 2, 1),
(4, 'A qualidade do serviço realizado atendeu às suas expectativas?', 1, 2, 1),
(5, 'Qual a nota de atendimento geral você daria para este atendimento?', 2, 2, 1),
(6, 'Caso tenha alguma sugestão ou queira compartilhar mais detalhes sobre sua experiência, utilize o espaço abaixo:', 1, 1, 1);


INSERT INTO DB_HELPDESK_CB.dbo.QuestaoResposta (QuestaoIdf, RespostaIdf, QuestaoRespostaOrd)
VALUES 
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(2, 1, 1),
(2, 2, 2),
(2, 3, 3),
(2, 4, 4),
(2, 5, 5),
(3, 1, 1),
(3, 2, 2),
(3, 3, 3),
(3, 4, 4),
(3, 5, 5),
(4, 1, 1),
(4, 2, 2),
(4, 3, 3),
(4, 4, 4),
(4, 5, 5),
(5, 1, 1),
(5, 2, 2),
(5, 3, 3),
(5, 4, 4),
(5, 5, 5);


INSERT INTO DB_HELPDESK_CB.dbo.Questionario (QuestionarioIdf, QuestionarioDesc, QuestionarioAtv)
VALUES (1, 'Help Desk CB', 1);


INSERT INTO DB_HELPDESK_CB.dbo.QuestaoQuestionario
(QuestaoIdf, QuestionarioIdf, QuestaoQuestionarioOrd)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6)
;





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

