dl = [{'a': 10, 'b': 20, 'c': 1}, {'a': 5, 'b': 10, 'z': 10}, {'a': 3, 'y': 7}]

dl.sort(key=lambda x:x['a'])
print(dl)