require 'bowling_game'

describe 'BowlingGame' do
  let (:game) { Game.new }

  def roll_spare
    2.times { game.roll 5 }
  end

  it 'scores zero for a gutter game' do
    20.times { game.roll 0 }
    game.score.should == 0
  end

  it 'scores a game with all ones' do
    20.times { game.roll 1 }
    game.score.should == 20
  end

  it 'scores a spare correctly' do
    roll_spare
    game.roll 3
    game.roll 4
    16.times { game.roll 0 }
    game.score.should == 20
  end


  it 'scores a strike correctly' do
    game.roll 10
    game.roll 3
    game.roll 4
    16.times { game.roll 0 }
    game.score.should == 24
  end

  it 'scores a perfect game correctly' do
    12.times { game.roll 10 }
    game.score.should == 300
  end
end
