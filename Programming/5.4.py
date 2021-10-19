def multi(*values):
    res = 1
    for i in values:
        res *= i
    return res
print(multi(1,2,3,4,5))
print(multi(5,10,15,20))
