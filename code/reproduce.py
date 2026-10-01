# Reproduces the main regression from the CSV without SPSS.
# pip install pandas statsmodels
import pandas as pd
import statsmodels.formula.api as smf

df = pd.read_csv("data/KBO_2026_analysis_sample.csv")
df = df[df["AnalysisSample"] == 1]
model = smf.ols(
    "Attendance ~ WinPctGap + WeekendDummy + RankGap + HomeTeamOverallRank", data=df
).fit()
print(model.summary())
