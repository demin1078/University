def multiplication(x,y):
    """
    @type x: int|float
    @type y: int|float
    @return: Returns a multiplicated result
    @function will a return worth result when x and y are numbers
    """
    return x*y

print(multiplication(4,12))
price = float(input("Введите сколько стоит 1 товар: "))
quantity = int(input("Сколько товаров было куплено: ")) 
print("Стоимость покупки {}".format(multiplication(price,quantity)))