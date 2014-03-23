class Expression
  class Terminal
    def initialize(terminal)
      @terminal = terminal
    end

    def is_expression?
      false
    end

    def to_s
      @terminal.to_s
    end
  end
end

