"""Module for to demo python project
"""


class DemoHandler(object):
    """Placeholder class"""

    def __init__(self):
        print('Hallo, Welt.')

    def do_nothing(self):
        return

    def do_something(self):
        return 'Ain\'t that something?'

    def get_some_bool(self):
        return True


def main():

    demo = DemoHandler()
    print(demo.do_something())


if __name__ == '__main__':

    main()
