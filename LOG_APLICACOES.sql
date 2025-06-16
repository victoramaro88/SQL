SELECT TOP(50)
	*
--LogCod, IP, Host, ModLogCod, UsrCod, SisLogReg, datHorReg
FROM DB_LOG.SchLog.Log
--WHERE ModLogCod = 14
ORDER BY datHorReg DESC
;



SELECT SisLogCod, SisLog
FROM DB_LOG.SchLog.SisLog;

SELECT ModLogCod, SisLogCod, ModLog
FROM DB_LOG.SchLog.ModLog;



