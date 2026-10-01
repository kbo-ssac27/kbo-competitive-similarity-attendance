# KBO 2026 Competitive Similarity and Game Attendance

This repository contains the data and analysis materials for a study of game attendance in the 2026 Korea Baseball Organization (KBO) regular season. It accompanies an abstract submitted to the 2027 MIT Sloan Sports Analytics Conference Research Paper Competition. Author anonymized for review.

## Research question

Do games between teams that are closer in competitive standing attract more spectators?

The study focuses on two pre-game measures of competitive similarity:

1. Previous-Day Winning-Percentage Gap (`WinPctGap`)
2. Previous-Day Ranking Gap (`RankGap`)

Game attendance is the dependent variable. Weekend status and the home team's cumulative season rank are included as control variables.

## Hypotheses

H1. The smaller the previous-day winning-percentage gap between the home and away teams, the higher the game attendance.

H2. The smaller the previous-day ranking gap between the home and away teams, the higher the game attendance.

## Data

The study uses game-level data from the 2026 KBO regular season.

- Initial dataset: 680 games
- Final analysis sample: 675 games
- Five opening-day games were excluded because previous-day standings were not available.

The focal competitive variables were constructed using information available before each game so that the explanatory variables reflect information spectators could have observed prior to attendance.

## Main variables

### Dependent variable

`Attendance`: the reported number of spectators attending each KBO game.

### Independent variables

`WinPctGap`: the absolute difference between the home and away teams' winning percentages before the focal game.

```
WinPctGap = |HomeWinPct - AwayWinPct|
```

A smaller value indicates that the teams had more similar winning records.

`RankGap`: the absolute difference between the home and away teams' league rankings before the focal game.

```
RankGap = |HomeRank - AwayRank|
```

A smaller value indicates that the teams were positioned closer together in the league standings.

### Control variables

`WeekendDummy`: weekend indicator.

- `1` = Saturday or Sunday
- `0` = Monday through Friday

`HomeTeamOverallRank`: the home team's cumulative overall season rank, used as a team-quality control. A lower numerical value indicates a stronger overall rank. This value is constant for each team and comes from late-season 2026 standings, so unlike the two focal variables it is not information spectators had before each game.

## Analysis

The main analysis uses multiple linear regression with game attendance as the dependent variable.

The model is specified as:

```
Attendance = β0 + β1(WinPctGap) + β2(RankGap) + β3(WeekendDummy) + β4(HomeTeamOverallRank) + ε
```

IBM SPSS Statistics was used for the primary analysis.

## Results

| Variable | B | SE | β | t | p |
|---|---|---|---|---|---|
| Constant | 20,572.617 | 502.711 | | 40.923 | < .001 |
| WinPctGap | 538.421 | 1,605.463 | .014 | 0.335 | .737 |
| RankGap | −194.508 | 95.715 | −.086 | −2.032 | .043 |
| WeekendDummy | 3,068.457 | 374.029 | .284 | 8.204 | < .001 |
| HomeTeamOverallRank | −604.838 | 61.228 | −.342 | −9.878 | < .001 |

N = 675. R = .448, R² = .200, adjusted R² = .196, F(4, 670) = 41.960, p < .001.

H1 was not supported. H2 was supported in the full-season sample: holding the other variables constant, each one-position increase in the ranking gap was associated with approximately 195 fewer spectators.

## Repository files

- `data/KBO_2026_full_data.csv`: complete game-level dataset
- `data/KBO_2026_analysis_sample.csv`: analysis sample excluding games without prior standings
- `data/sports-KBO-2026.sav`: SPSS analysis dataset
- `data/KBO_2026_Data_Dictionary.xlsx`: variable definitions and coding information
- `code/KBO_analysis.sps`: SPSS syntax for the primary regression analysis
- `code/reproduce.py`: the same regression in Python

## Official data sources

KBO Daily Attendance: https://www.koreabaseball.com/Record/Crowd/GraphDaily.aspx
Used for game-level attendance, date, teams, and stadium information.

KBO Daily Team Standings: https://www.koreabaseball.com/Record/TeamRank/TeamRankDaily.aspx
Used to construct pre-game rankings and winning percentages.

## Reproducibility

The CSV files are provided to make the dataset accessible across statistical software packages. The SPSS `.sav` file contains the same 675-game analysis sample, and the `.sps` file documents the primary regression specification. To reproduce the results in SPSS, open `data/sports-KBO-2026.sav` and run `code/KBO_analysis.sps`. Without SPSS, run `pip install pandas statsmodels` and then `python code/reproduce.py` from the repository root.

Correction note: an earlier working version of the SPSS file coded the five games on Saturday, August 29, 2026 as weekday games. The files in this repository code them as weekend games, and the results above reflect that correction.

Detailed variable definitions are available in the data dictionary.

## Citation

Data source: Korea Baseball Organization (KBO), 2026 daily attendance and daily team standings records.
