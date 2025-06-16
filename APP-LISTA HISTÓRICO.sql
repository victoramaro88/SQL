SELECT 
       h.StdCod,
       h.StdDat,
       h.HisStdSeqNum,
       h.HisStdDes,
       h.PesIdf,
       h.HisStdIclDat,
CONCAT (
		'http://maps.google.com/maps?q=',
		l.StdLocLat,
		', ',
		l.StdLocLng
	) AS PONTO_EXATO,
CONCAT (
		'http://maps.google.com/maps?q=',
		l.StdLocPrxLat,
		', ',
		StdLocPrxLng
	) AS PONTO_PROXIMO,
CONCAT (
		'http://maps.google.com/maps?q=',
		l.StdLocSltLat,
		', ',
		StdLocSltLng
	) AS PONTO_SOLICITACAO,
CONCAT (
		'http://prdwiang.ccb.policiamilitar.sp.gov.br/ImgApp/',
		a.StdArdEnd
	) AS IMAGEM
FROM 
       COBOM_ONLINE.SchCOBONL.HISSTD h
INNER JOIN COBOM_ONLINE.SchCOBONL.STDLOC l ON h.StdCod = l.StdCod AND h.StdDat = l.StdDat
INNER JOIN COBOM_ONLINE.SchCOBONL.STDARQ a ON h.StdCod = a.StdCod AND h.StdDat = a.StdDat
--WHERE 
 --      h.StdCod = 6  AND h.StdDat = '2022-01-12'
ORDER BY StdDat DESC