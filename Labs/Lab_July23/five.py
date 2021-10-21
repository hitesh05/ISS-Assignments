"""
Be careful while indenting the code.
Current indentation size: 4 spaces; no tab
"""
import random
import timeit
old_prices = [random.randrange(100) for _ in range(100000)]
# print(old_prices)
def get_price(old_price):
    return old_price * 1.8


# ---Don't edit above this line-------
def get_prices_with_map():
    # logic goes here
    res = list(map(get_price,old_prices))
    return res


def get_prices_with_comprehension():
    # logic goes here
    res = [get_price(i) for i in old_prices]
    return res

def get_prices_with_loop():
    # logic goes here
    res = []
    for i in old_prices:
        res.append(get_price(i))
    return res

# ---Don't edit below this line-------


print("map function: ", timeit.timeit(get_prices_with_map, number=100))
print("comprehension: ",timeit.timeit(get_prices_with_comprehension, number=100))
print("for loop: ", timeit.timeit(get_prices_with_loop, number=100))