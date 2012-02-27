class WrongNumberOfPlayersError < StandardError
end

class NoSuchStrategyError < StandardError 
end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    raise NoSuchStrategyError unless game.all? {|x| x.length == 2 && x[1] != nil && ['r', 'p', 's'].include?(x[1].downcase)}

    player_strategies = [game[0][1].downcase, game[1][1].downcase]
    
    rules = [['r', 'r'], ['s', 's'], ['p', 'p'], ['r', 's'], ['p', 'r'], ['s', 'p']]
    rules.each do |x|       
        return game[0] if x == player_strategies
        return game[1] if x == player_strategies.reverse
    end
end

def rps_tornament_winner(games)
    if is_group? games
        first_winner = rps_tornament_winner games[0]
        second_winner = rps_tornament_winner games[1]
        return rps_game_winner([first_winner, second_winner])
    end
    
    return rps_game_winner(games)
    #if is_groups? games
    #    games.map(
    #games.each do |g|
        
    #end
    #winners = games.map{|x| rps_game_winner x}
    #return winners.first if winners.length == 1
    #return rps_tornament_winner winners.each_slice(2) {|a| p a}
end

def is_group?(games)
    return games.flatten.length > 4
end