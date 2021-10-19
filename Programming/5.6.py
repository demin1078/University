def calc(expression):
    express = expression.split()
    x = int(express[0])
    y = int(express[2])
    sign = express[1]

    if sign == '+':
        return x + y

    if sign == '*':
        return x * y

    if sign == '-':
        return x - y

    if sign == '\\':
        return x / y

    if sign == '/':
        return x // y

    if sign == '%':
        return x % y
    
    if sign == '^':
        return x ** y
print(calc('13 - 5'))
print(calc('13 \ 4'))
print(calc('13 / 4'))