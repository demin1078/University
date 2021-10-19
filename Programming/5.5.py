def multi(x,y):
    return x*y
def power(x,y):
    return x**y
def minus(x,y):
    return x-y
def plus(x,y):
    return x+y

express = input().split()
x = int(express[0])
y = int(express[2])
operation = express[1]
operations = {
    '*' : multi(x,y),
    '^' : power(x,y),
    '-':minus(x,y),
    '+':plus(x,y)
}
print("answer is {}".format(operations[operation]))
