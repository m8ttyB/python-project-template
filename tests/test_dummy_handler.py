import unittest
import requests
from mock import Mock, patch
from demo.demo_handler import DemoHandler


d = DemoHandler()


class DemoTestCase(unittest.TestCase):
    """Tests for `demo_handler.py`."""

    def test_some_bool(self):
        """Does this function actually return True?"""
        print('access_token=XXXXX')
        # self.assertTrue(d.some_bool())
        self.assertFalse(d.some_bool())

    def test_do_nothing(self):
        """Does this function actually return False?"""
        self.assertFalse(d.do_nothing())

    def test_do_something(self):
        """Does this function actually does return some string?"""
        self.assertTrue(d.do_something())

    def test_remote_data(self):
        with patch.object(requests, 'get') as get_mock:
            get_mock.return_value = mock_response = Mock()
            mock_response.status_code = 200
            mock_response.text = '[{"key": "value"}]'

            results = d.remote_data()
            assert results == '[{"key": "value"}]'
            self.assertNotEqual(results, None)
            self.assertEqual(results, mock_response.text)
            self.assertTrue('key' in results)


if __name__ == '__main__':
    unittest.main()
