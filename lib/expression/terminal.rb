class Expression
  class Terminal
    def initialize(variable_terminals)
      if is_variable?
        @terminal = variable_terminals.sample
      else
        @terminal = (10 * rand).round(1)
        if make_number_negative?
          @terminal = -1 * @terminal
        end
      end
    end

    def is_variable?
      coin_toss_is_heads?
    end

    def make_number_negative?
      coin_toss_is_heads?
    end

    def coin_toss_is_heads?
      rand > 0.5
    end

    def to_s
      @terminal.to_s
    end
  end
end


