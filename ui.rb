
class UI
  include Curses

  def initialize
    noecho  # do not print chars the user types
    init_screen
  end

  def close
    close_screen
  end

  def clear
    super
  end

  def message(y, x, string)
    setpos(y, x)    # place the cursor at the position
    addstr(string)  # prints msg at cursor location
  end

  def choice_prompt(y, x, string, choices)
    message(y, x, string + " ")
    
    loop do
      choice = getch
      return choice if choices.include?(choice)
    end
  end

end