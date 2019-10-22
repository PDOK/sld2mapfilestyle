import unittest
from sld2mapfilestyle.sld2mapfilestyle import get_style_string

class TestFilter(unittest.TestCase):

    def test_filter_property_is_between(self):
        style_string = get_style_string("test/sld/filter/property_is_between_1.0.0.sld")
        self.assertIn("EXPRESSION ([basisonderwijs_aantal_binnen_1_km] ge 0.0 AND [basisonderwijs_aantal_binnen_1_km] le 0.05)", style_string)
        self.assertIn("EXPRESSION ([basisonderwijs_aantal_binnen_1_km] ge 0.050001 AND [basisonderwijs_aantal_binnen_1_km] le 1.4)", style_string)
        self.assertIn("EXPRESSION ([basisonderwijs_aantal_binnen_1_km] ge 1.400001 AND [basisonderwijs_aantal_binnen_1_km] le 2.4)", style_string)
        self.assertIn("EXPRESSION ([basisonderwijs_aantal_binnen_1_km] ge 2.400001 AND [basisonderwijs_aantal_binnen_1_km] le 3.4)", style_string)
        self.assertIn("EXPRESSION ([basisonderwijs_aantal_binnen_1_km] ge 3.400001 AND [basisonderwijs_aantal_binnen_1_km] le 4.4)", style_string)
        self.assertIn("EXPRESSION ([basisonderwijs_aantal_binnen_1_km] ge 4.400001 AND [basisonderwijs_aantal_binnen_1_km] le 5.4)", style_string)
        self.assertIn("EXPRESSION ([basisonderwijs_aantal_binnen_1_km] ge 5.400001 AND [basisonderwijs_aantal_binnen_1_km] le 100.0)", style_string)

    def test_filter_and_greaterthanequal_lessthan(self):
        style_string = get_style_string("test/sld/filter/and_greater_than_equal_less_than_1.0.0.sld")
        self.assertIn("EXPRESSION ([aantal_personen_met_uitkering_onder_aowlft] ge 4.000001 AND [aantal_personen_met_uitkering_onder_aowlft] lt 99.0)", style_string)
        self.assertIn("EXPRESSION ([aantal_personen_met_uitkering_onder_aowlft] ge 99.000001 AND [aantal_personen_met_uitkering_onder_aowlft] lt 249.0)", style_string)
        self.assertIn("EXPRESSION ([aantal_personen_met_uitkering_onder_aowlft] ge 249.000001 AND [aantal_personen_met_uitkering_onder_aowlft] lt 499.0)", style_string)
        self.assertIn("EXPRESSION ([aantal_personen_met_uitkering_onder_aowlft] ge 499.000001 AND [aantal_personen_met_uitkering_onder_aowlft] lt 999.0)", style_string)
        self.assertIn("EXPRESSION ([aantal_personen_met_uitkering_onder_aowlft] ge 999.000001)", style_string)

    def test_filter_property_is_equal_to_2(self):
        style_string = get_style_string("test/sld/filter/property_is_equal_to_1.0.0_2.sld")
        self.assertIn("EXPRESSION \"16540\"", style_string)
        self.assertIn("EXPRESSION \"11080\"", style_string)
        self.assertIn("EXPRESSION \"11070\"", style_string)
        self.assertIn("EXPRESSION \"11030\"", style_string)
        self.assertIn("EXPRESSION \"11002\"", style_string)
        self.assertIn("EXPRESSION \"11000\"", style_string)

    def test_filter_property_is_equal_to(self):
        style_string = get_style_string("test/sld/filter/property_is_equal_to_1.0.0.sld")
        self.assertIn("EXPRESSION \"80-100 hoog\"", style_string)
        self.assertIn("EXPRESSION \"60-100 boven midden tot hoog\"", style_string)
        self.assertIn("EXPRESSION \"60-80 boven midden\"", style_string)
        self.assertIn("EXPRESSION \"40-80 midden tot boven midden\"", style_string)
        self.assertIn("EXPRESSION \"40-60 midden\"", style_string)
        self.assertIn("EXPRESSION \"20-80 onder midden tot boven midden\"", style_string)
        self.assertIn("EXPRESSION \"20-60 onder midden tot midden\"", style_string)
        self.assertIn("EXPRESSION \"20-40 onder midden\"", style_string)
        self.assertIn("EXPRESSION \"00-60 laag tot midden\"", style_string)
        self.assertIn("EXPRESSION \"00-40 laag tot onder midden\"", style_string)
        self.assertIn("EXPRESSION \"00-20 laag\"", style_string)
        self.assertIn("EXPRESSION \"onclassificeerbaar\"", style_string)

if __name__ == '__main__':
    unittest.main()
