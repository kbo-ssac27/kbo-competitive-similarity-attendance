* KBO 2026 competitive similarity and attendance: primary regression.
* Open data/sports-KBO-2026.sav before running (File > Open > Data).

FILTER OFF.
USE ALL.
SELECT IF (AnalysisSample = 1).

DESCRIPTIVES VARIABLES=Attendance WinPctGap RankGap WeekendDummy HomeTeamOverallRank
  /STATISTICS=MEAN STDDEV MIN MAX.

REGRESSION
  /STATISTICS COEFF OUTS R ANOVA
  /DEPENDENT Attendance
  /METHOD=ENTER WinPctGap WeekendDummy RankGap HomeTeamOverallRank.
