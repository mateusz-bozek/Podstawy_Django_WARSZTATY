from django.test import TestCase

# Create your tests here.

class MyClass:
    def method(self):
        return 'instance method called', self

    @classmethod
    def classmethod(cls):
        return 'class method called', cls

    @staticmethod
    def __staticmethod():
        return 'static method called'

    def instance_method(self):
        return self.__staticmethod()

    def instance_method2(self):
        return MyClass.__staticmethod()

if __name__ == '__main__':
    mc = MyClass()
    print(mc.instance_method())
    print(mc.instance_method2())
    print(MyClass._MyClass__staticmethod())