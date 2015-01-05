class DummyHandler(object):

    def __init__(self):
        print "Hallo, Welt."

    def do_nothing(self):
        return

    def do_something(self):
        return "Ain't that something?"

    def get_some_bool(self):
        return True


if __name__ == '__main__':

    dummy = DummyHandler()
    print dummy.do_nothing()
    print dummy.do_something()
