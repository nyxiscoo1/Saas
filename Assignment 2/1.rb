class Numeric
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if Money.is_supported(singular_currency)
      return Money.new(self, singular_currency)
    else
      super
    end
  end
end

class Money
    @@currencies_to_dollar = { 
    'yen' => 0.013, 
    'euro' => 1.292, 
    'rupee' => 0.019, 
    'dollar' => 1
    }
    
    def self.is_supported(currency)
        singular_currency = currency.to_s.gsub( /s$/, '')  
        return @@currencies_to_dollar.has_key?(singular_currency)
    end

    attr_reader :amount, :name
    
    def initialize(amount, name)
        @amount = amount
        @name = name
         # TODO: check name
    end
    
    def in(currency)
        singular_currency = currency.to_s.gsub( /s$/, '')
        
        if @@currencies_to_dollar.has_key?(singular_currency)
            in_dollars = @amount * @@currencies_to_dollar[name]
            return in_dollars / @@currencies_to_dollar[singular_currency]
        else
            # TODO: throw
        end
    end   
end

module Enumerable
    def palindrome?()
        return self.each.to_a.reverse == self.each.to_a
    end
end

class String
    def palindrome?()
        downcased = self.gsub(/\W/, '').downcase()
        downcased == downcased.reverse()
    end
end