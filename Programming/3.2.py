import random
arr = []
for i in range(random.randint(4,10)):
    arr.append(random.randint(1,20))

print("Сгенерированный массив:" + ",".join(map(str, arr)))
arrSet = set(arr)
print("Массив без повторяющихся элементов: " + ",".join(map(str,arrSet)))