SELECT VtrIdf, VeiCod, VtrSitCod, VtrPatNum, VtrOprIniDat, VtrFto, VtrCpfIclNum, VtrIclDat
FROM DB_SIGEV.SchSIGEV.VTR;





































SELECT PfxVtrIdf, PfxVtrSubClsIdf, PfxVtrClsCod, PfxVtrNum, PfxVtrCod
FROM DB_SIGEV.SchSIGEV.PFXVTR;










SELECT * FROM DB_SIGEV.SchSIGEV.VEI VEI WITH(NOLOCK)
JOIN DB_SIGEV.SchSIGEV.VTR VTR WITH(NOLOCK) ON VEI.VeiCod = VTR.VeiCod
JOIN DB_SIGEV.SchSIGEV.VTRSIT VTRSIT WITH(NOLOCK) ON VTR.VtrSitCod = VTRSIT.VtrSitCod




