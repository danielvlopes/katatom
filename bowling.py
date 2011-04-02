import unittest

class Game:
  def __init__(self):
    self._rolls = []

  def roll(self, pins):
    self._rolls.append(pins)

  def score(self):
    score = 0 
    i = 0
    for n in xrange(10):
      if self._rolls[i] == 10:
        score += 10 + self._rolls[i+1] + self._rolls[i+2]
        i += 1
      elif self._rolls[i] + self._rolls[i+1] == 10:
        score += 10 + self._rolls[i + 2] 
        i += 2
      else:
        score += self._rolls[i] + self._rolls[i+1]
        i += 2

    return score

class TestBowlingGame(unittest.TestCase):
  def setUp(self):
    self.game = Game()

  def roll_many(self, amount, pins):
    for n in xrange(amount): self.game.roll(pins)

  def roll_spare(self):
    self.game.roll(5)
    self.game.roll(5)

  def test_gutter_game(self):
    self.roll_many(20, 0)
    assert self.game.score() == 0

  def test_all_ones(self):
    self.roll_many(20, 1)
    assert self.game.score() == 20

  def test_spare(self):
    self.roll_spare()
    self.game.roll(3)
    self.game.roll(4)
    self.roll_many(16, 0)
    assert self.game.score() == 20 


  def test_strike(self):
    self.game.roll(10)
    self.game.roll(3)
    self.game.roll(4)
    self.roll_many(16, 0)
    assert self.game.score() == 24 

  def test_perfect_game(self):
    self.roll_many(12, 10)
    assert self.game.score() == 300


unittest.main()
