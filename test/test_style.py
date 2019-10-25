import unittest
from sld2mapfilestyle.main import get_style_string

class TestStyle(unittest.TestCase):

    def test_geom_transform(self):
        style_string = get_style_string("test/sld/filter/centroid_1.0.0.sld")
        geom_tran_count = style_string.count("GEOMTRANSFORM \"centroid\"")
        self.assertEqual(geom_tran_count, 10)

if __name__ == '__main__':
    unittest.main()
