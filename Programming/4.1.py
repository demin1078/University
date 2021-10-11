import math


def numbToWord(x):
    x = int(x)
    word = ""

    if x == 0:
        return "ноль"
    
    hun = x % 1000 // 100
    if hun == 1:
        word += "сто"
    elif hun == 2:
        word += "двести"
    elif hun == 3:
        word += "триста"
    elif hun == 4:
        word += "четыреста"
    elif hun == 5:
        word += "пятьсот"
    elif hun == 6:
        word += "шестьсот"
    elif hun == 7:
        word += "семьсот"
    elif hun == 8:
        word += "восемьсот"
    elif hun == 9:
        word += "девятьсот"
    word += " "
  
    tL = x % 100
    decade = x % 100 // 10

    if decade == 2:
        word += "двадцать"
    elif decade == 3:
        word += "тридцать"
    elif decade == 4:
        word += "сорок"
    elif decade == 5:
        word += "пятьдесят"
    elif decade == 6:
        word += "шестьдесят"
    elif decade == 7:
        word += "семьдесят"
    elif decade == 8:
        word += "восемьдесят"
    elif decade == 9:
        word += "девяносто"
    word += " "
    
    thLet= x%10
    if tL == 10:
        word += "десять"
    if tL == 11:
        word += "одиннадцать"
    elif tL == 12:
        word += "двенадцать"
    elif tL == 13:
        word += "тринадцать"
    elif tL == 14:
        word += "четырнадцать"
    elif tL == 15:
        word += "пятнадцать"
    elif tL == 16:
        word += "шестнадцать"
    elif tL == 17:
        word += "семнадцать"
    elif tL == 18:
        word += "восемнадцать"
    elif tL == 19:
        word += "девятнадцать"
    elif thLet == 1:
        word += "один"
    elif thLet == 2:
        word += "два"
    elif thLet == 3:
        word += "три"
    elif thLet == 4:
        word += "четыре"
    elif thLet == 5:
        word += "пять"
    elif thLet == 6:
        word += "шесть"
    elif thLet == 7:
        word += "семь"
    elif thLet == 8:
        word += "восемь"
    elif thLet == 9:
        word += "девять"
  
    return word
 
def wordToNumb(x):
    for i in range(0,1000):
       
        if numbToWord(i).strip() == x:
            return i
    return -1

print("Введите выражение:")
express = input()

operations = "*,/,+,-,\,%,^"
operations = operations.split(",")

fs = ""
sc = ""
operation = ""
wasOperate = False
for i in express:
    if not(wasOperate) and (i not in operations):
        fs += i
    elif i in operations:
        wasOperate = True
        operation = i
    else:
        
        sc += i
fs= wordToNumb(fs.strip())
sc =  wordToNumb(sc.strip())

print("{} {} {}".format(fs, operation,sc))

if operation == "" or sc == -1 or fs == -1:
    print("В введённом выражении ошибка!")
else:
    if operation == "+":
        print(fs + sc)
    elif operation == "/":
        print(fs /sc)
    elif operation == "*":
        print(fs*sc)
    elif operation == "-":
        print(fs-sc)
    elif operation == "\\":
        print(fs//sc)
    elif operation == "%":
        print(fs%sc)
    elif operation == "^":
        print(math.pow(fs,sc))
