arr = input()
arr =[int(i) for i in arr.split(" ") if(int(i) < 0) ]

minNegative = max(arr)
print("Максимальное число среди отрицательных:" + str(minNegative))

