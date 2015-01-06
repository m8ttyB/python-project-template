class DummyHandler(object):

    def __init__(self):
        print "Hallo, Welt."

    def do_nothing(self):
        return

    def do_something(self):
        return "Ain't that something?"

    def get_some_bool(self):
        return True

#
def main():
    dh = DummyHandler()
    print dh.do_something()


if __name__ == '__main__':
    main()
   # dummy = DummyHandler()
   # print dummy.do_something()
