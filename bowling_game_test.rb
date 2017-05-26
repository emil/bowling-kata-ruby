require 'minitest/autorun'
require_relative 'bowling_game'

class BowlingTest < MiniTest::Test
  
  def test_zero_score
    g = BowlingGame.new
    10.times.each {|i| g.roll 0}
    
    assert_equal 0, g.score
  end
  
  def test_one_strike
    g = BowlingGame.new
    g.roll 10
    g.roll 3
    g.roll 4

    assert_equal 24, g.score
  end

  def test_one_spare
    g = BowlingGame.new
    g.roll 5
    g.roll 5
    g.roll 3

    assert_equal 16, g.score
  end
  
  def test_perfect_score
    g = BowlingGame.new
    12.times.each {|i| g.roll 10}
    
    assert_equal 300, g.score
  end

  
  def test_exeeds_rolls_raises
    g = BowlingGame.new
    21.times.each {|i| g.roll 0}
    assert_raises ArgumentError do
      g.roll 0
    end
  end

  def test_all_ones_scores_20
    g = BowlingGame.new
    20.times.each {|i| g.roll 1}
    
    assert_equal 20, g.score
  end

  # http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata
  def test_second_implementation
    g = BowlingGame.new
    [
     [[1,4],5],
     [[4,5],14],
     [[6,4],24],
     [[5,5],39],
     [[10,0,1],61],
     [[7,3],71],
     [[6,4],87],
     [[10,2,8],127],
     [[6],133]
    ].each do |rolls,score|
      rolls.each {|r| g.roll r}
      assert_equal score, g.score
    end
  end

end
