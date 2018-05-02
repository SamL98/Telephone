import pandas as pd

df = pd.read_csv('gender-data.csv')
wv2df = df.loc[df['wave'] == 2]
wv3df = df.loc[df['wave'] == 3]

print(wv2df['male references'].sum(), wv2df['female references'].sum())
print(wv3df['male references'].sum(), wv3df['female references'].sum())