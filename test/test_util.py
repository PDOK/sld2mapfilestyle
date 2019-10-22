import unittest
from sld2mapfilestyle.sld2mapfilestyle import get_output_filepath

class TestUtil(unittest.TestCase):

    def test_get_output_filepath(self):
        output_path = get_output_filepath("test/sld/version/1.1.0.sld", "output_dir", ".style")
        self.assertEqual(output_path, "output_dir/1.1.0.style")

if __name__ == '__main__':
    unittest.main()
