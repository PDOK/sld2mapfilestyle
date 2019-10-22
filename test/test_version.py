import unittest
from sld2mapfilestyle.sld2mapfilestyle import get_sld_version

class TestDetectSLDVersion(unittest.TestCase):

    def test_is110(self):
        version = get_sld_version("test/sld/version/1.1.0.sld")
        self.assertEqual(version, '1.1.0')

    def test_is100(self):
        version = get_sld_version("test/sld/version/1.0.0.sld")
        self.assertEqual(version, '1.0.0')

if __name__ == '__main__':
    unittest.main()
