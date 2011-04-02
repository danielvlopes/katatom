class Game

  def initialize
    @rolls = []
    @frames = []
    @current_frame = nil
  end

  def roll(pins)
    @rolls << pins
  end


  def score
    score = 0
    frame_index = 0
    
    10.times do 
      if strike?(frame_index)
        score += bonus_for_strike(frame_index)
        frame_index += 1
      elsif spare?(frame_index)
        score += 10 + @rolls[frame_index+2]
        frame_index += 2
      else
        score += number_of_balls_in_game(frame_index)
        frame_index += 2
      end
    end 
    score
  end

  def number_of_balls_in_game(frame_index)
    @rolls[frame_index] + @rolls[frame_index+1]
  end
  
  def bonus_for_spare(frame_index)
    @rolls[frame_index+2]
  end

  def bonus_for_strike(frame_index)
    10 + @rolls[frame_index+1] + @rolls[frame_index+2]
  end

  def spare?(frame_index)
    @rolls[frame_index] + @rolls[frame_index+1] == 10
  end

  def strike?(frame_index)
    @rolls[frame_index] == 10
  end
end
