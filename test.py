import requests
import time
from pprint import pprint
import sys


payload = {
    "cmd": "get",
    "data": {
        "id":sys.argv[1],
        "date": int(time.time() * 1000) - 1000 * 1000 * 60 * 60 * 15
    }
}

print(payload['data']['date'])

res = requests.post('https://rozvrh.spse.cz/index.php', json=payload)

pprint(res.json())