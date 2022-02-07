import pandas as pd
import re

def get_info(pattern, lst, dic, key):
    dic[key]=[]
    for i in lst:
        res = re.findall(pattern,i)
        if res:
            dic[key].append(res[0])
        else:
            dic[key].append('No info')
    return dic[key]


def get_subject (pattern, lst, dic, key):
    dic[key]=[]
    for i in lst:
        res = re.findall(pattern,i)
        if res:
            dic[key].append(res[0][2:])
        else:
            dic[key].append('No info')
    return dic[key]

def get_sender (pattern, lst, dic, key):
    dic[key]=[]
    for i in lst:
        res = re.findall(pattern,i)
        if res:
            dic[key].append(' '.join(res[0].split()[1:-1]))
        else:
            dic[key].append('No info')
    return dic[key]

