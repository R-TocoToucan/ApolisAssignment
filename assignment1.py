def reverseArray(arr):
    return arr[::-1]


def isPrime(n):
    if n > 1:
        for i in range(2, (n/2)+1):
            if n % i == 0:
                return False
        return True

    return False

def findPrime(arr):
    ans = []
    for n in arr:
        if isPrime(n):
            ans.append(n)
    return ans

def findOdd(arr):
    ans = []
    for i in arr:
        if i % 2 != 0:
            ans.append(i)
    return ans

def factorial(n):
    if n == 1:
        return n
    else:
        return n * factorial(n-1)

def divideArray(arr, size):
    ans = []
    i = 0
    while (i + size) <= len(arr):
        temp = []
        for j in range(size):
            temp.append(arr[i])
            i += 1
        ans.append(temp)
    return ans

def main():
    array = [1,2,3,4,5,6,7]
    groupsize = 3

    print(reverseArray(array))
    print(findPrime(array))
    print(findOdd(array))
    print(factorial(5))
    print(divideArray(array, groupsize))

if __name__ == "__main__":
    main()
