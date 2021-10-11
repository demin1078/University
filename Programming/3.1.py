import random

arr = []
minEven = 1000000
minEvenIndex = -1

for i in range(random.randint(4,10)):
    arr.append(random.randint(1,20))
print("Сгенерированный массив:" + ",".join(map(str, arr)))

for i in range(len(arr)):
    if arr[i] % 2 == 0 and arr[i] < minEven:
        minEven = arr[i]
        minEvenIndex = i
    
arrWithDivided = []
for i in arr:
    if i % minEven == 0:
        arrWithDivided.append(i)
if minEvenIndex== -1:
    print("В заданном массиве нет чётных элементов")
else:
    print("Минимальный чётный элемент "+ str(minEven))
    print("Массив:" + ",".join(map(str,arrWithDivided)))