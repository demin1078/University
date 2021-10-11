import random
arr = []
for i in range(random.randint(4,10)):
    arr.append(random.randint(1,20))

arrSet = set(arr)
print("Массив без повторяющихся элементов: " + ",".join(map(str,arrSet)))