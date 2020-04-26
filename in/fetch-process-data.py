from typing import List
import requests 
import pandas as pd
import json
import os

DATA_URL='https://api.covid19india.org/data.json'

def _getdata():
    try:
        r = requests.get(DATA_URL)
        return r.json()
    except Exception as e:
        print(e)

def _json(data: List[dict]):
    for key in data.keys():
        with open(f'./data/{key}.json','w') as f:
            f.write(json.dumps(data.get(key), indent=4))

def _csv(data: List[dict]):
    for key in data.keys():
        df = pd.DataFrame(data=data.get(key))
        df.to_csv(f'./data/{key}.csv', index=False)

def main():
    data = _getdata()
    _json(data=data)
    _csv(data=data)

if __name__ == '__main__':
    if not os.path.exists('./data/'):
        os.makedirs('./data/')
    main()


