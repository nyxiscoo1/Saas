require 'rps.rb'

describe "rps_game_winner" do
    it "should raise WrongNumberOfPlayersError if the number of player is not equal to 2" do
        lambda { rps_game_winner [["Player1", "P"], ["Player2", "P"], ["Player3", "S"]] }.should raise_error(WrongNumberOfPlayersError)
        lambda { rps_game_winner [["Player1", "P"]] }.should raise_error(WrongNumberOfPlayersError)
        lambda { rps_game_winner [] }.should raise_error(WrongNumberOfPlayersError)
    end
    
    it "should raise NoSuchStrategyError if either player's strategy other than 'R', 'P' or 'S'" do
        lambda { rps_game_winner [["Player1", "A"], ["Player2", "P"]] }.should raise_error(NoSuchStrategyError)
        lambda { rps_game_winner [["Player1", "P"], ["Player2", "A"]] }.should raise_error(NoSuchStrategyError)
        lambda { rps_game_winner [["Player1", "A"], ["Player2", "A"]] }.should raise_error(NoSuchStrategyError)
        lambda { rps_game_winner [["Player1", nil], ["Player2", nil]] }.should raise_error(NoSuchStrategyError)
    end
    
    it "should return the name and strategy of the winning player" do
        rps_game_winner([["Player1", "P"], ["Player2", "R"]]).should eql(["Player1", "P"])
        rps_game_winner([["Player1", "S"], ["Player2", "R"]]).should eql(["Player2", "R"])
        rps_game_winner([["Player1", "S"], ["Player2", "P"]]).should eql(["Player1", "S"])
    end
    
    it "should return first player if both use same strategy" do
        rps_game_winner([["Player1", "P"], ["Player2", "P"]]).should eql(["Player1", "P"])
        rps_game_winner([["Player1", "S"], ["Player2", "S"]]).should eql(["Player1", "S"])
        rps_game_winner([["Player1", "R"], ["Player2", "R"]]).should eql(["Player1", "R"])
    end
end

describe "rps_tornament_winner" do
    it "should do tornament" do
        tornament = [
        [
          [ ["Armando", "P"], ["Dave", "S"] ],
          [ ["Richard", "R"], ["Michael", "S"] ]
        ],
        [
          [ ["Allen", "S"], ["Omer", "P"] ],
          [ ["Dave E.", "R"], ["Richard X.", "P"] ]
        ]
        ]
        
        rps_tornament_winner(tornament).should eql(["Richard", "R"])
    end
    
    it "should process even more deep nesting" do
        tornament = [ #R Player3
        [ #R Player3
          [ #R Player3
            [ ["Player1", "P"], ["Player2", "S"] ], #S Player2
            [ ["Player3", "R"], ["Player4", "S"] ]  #R Player3
          ],
          [ #S Player5
            [ ["Player5", "S"], ["Player6", "P"] ], #S Player5
            [ ["Player7", "R"], ["Player8", "P"] ]  #P Player8
          ]
        ],
        [ #R Player15
          [ #R Player15
            [ ["Player13", "P"], ["Player14", "S"] ], #S Player14
            [ ["Player15", "R"], ["Player16", "S"] ]  #R Player15
          ],
          [ #S Player17
            [ ["Player17", "S"], ["Player18", "P"] ], #S Player17
            [ ["Player19", "R"], ["Player20", "P"] ]  #P Player20
          ]
        ]
        ]
        
        rps_tornament_winner(tornament).should eql(["Player3", "R"])
    end
end