import unittest
from demo.demo_handler import DemoHandler

d = DemoHandler()


class DemoTestCase(unittest.TestCase):
    """Tests for `demo_handler.py`."""

    def test_get_some_bool(self):
        """Does this function actually return True?"""
        self.assertTrue(d.get_some_bool())

    def test_do_nothing(self):
        """Does this function actually return False?"""
        self.assertFalse(d.do_nothing())

    def test_do_something(self):
        """Does this function actually does return some string?"""
        self.assertTrue(d.do_something())

if __name__ == '__main__':
    unittest.main()
