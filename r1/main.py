from list import *

#3a)Check if a list is a set
def isEmpty(lst):
    if lst.prim is None:
        return True
    return False

def exists(lst,e):
    if isEmpty(lst):
        return False
    if getFirst(lst)==e:
        return True
    return exists(getRest(lst),e)

def getRest(lst):
    new_lst= Lista()
    new_lst.prim= lst.prim.urm
    return new_lst

def getFirst(lst):
    return lst.prim.e

def isSet(lst):
    if isEmpty(lst):
        return True
    if exists(getRest(lst),getFirst(lst)):
        return False
    return isSet(getRest(lst))

#3b)Determine the number of distinct elements from a list.
def distinct(lst):
    if isEmpty(lst):
        return 0
    if exists(getRest(lst),getFirst(lst)):
        return distinct(getRest(lst))
    return 1+distinct(getRest(lst))

'''
program pentru test
'''


def main():
    list = creareLista()
    print(isSet(list))
    print(distinct(creareLista()))

main()