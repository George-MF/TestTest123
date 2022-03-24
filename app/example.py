from random import randint

class Die:
    def __init__(self, sides=6):
        self.sides = sides
    
    def roll(self):
        return randint(1, self.sides)


class DiceBag:
    def __init__(self, sides=[]):
        self.dice = self.create_dice_from_sides(sides)
    
    def create_dice_from_sides(self, sides):
        return list(map(lambda side: Die(side), sides))
    
    def roll_bag(self):
        return list(map(lambda dice: dice.roll(), self.dice))
