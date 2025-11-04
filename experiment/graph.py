import pandas as pd
import matplotlib.pyplot as plt
import glob
import numpy as np

dfs = [pd.read_csv(f) for f in glob.glob("evolution_run_*/evolution_log.csv")]
data = pd.concat(dfs, keys=range(len(dfs)), names=['run'])

summary = data.groupby('Generation').agg(['mean', 'std'])
gens = summary.index

plt.plot(gens, summary['BestScore']['mean'], label='Best (mean)')
plt.fill_between(gens,
    summary['BestScore']['mean'] - summary['BestScore']['std'],
    summary['BestScore']['mean'] + summary['BestScore']['std'],
    alpha=0.2)
plt.plot(gens, summary['AverageScore']['mean'], label='Average (mean)', linestyle='--')
plt.xlabel("Generation")
plt.ylabel("Fitness")
plt.legend()
plt.title("CGP Performance")
plt.show()
plt.savefig("evolution_performance.png", dpi=300)