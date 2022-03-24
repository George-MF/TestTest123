import unittest
from dice_package.dice import Die

class TestDie(unittest.TestCase):

    def setUp(self):
        self.die = Die()

    def test_upper(self):
        self.assertEqual('foo'.upper(), 'FOO')
