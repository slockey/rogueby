
class Menu

  def Menu.start(ui, choices, values, row = 0, col = 0)
    menu = Menu.new(ui, choices, values, row, col)
    menu.menu_loop
  end

  def initialize(ui, choices, values, row, col)
    @ui = ui
    @choices = choices
    @num_choices = choices.length
    @values = values
    @index = 0
    @row = row
    @col = col
  end

  def menu_loop
    while true
      display
      input = @ui.get_key

      case input
      when KEYS::LOWER_S then
        @index += 1
        if @index == @num_choices then
          @index = 0
        end
      when KEYS::LOWER_W then
        @index -= 1
        if @index < 0 then
          @index = @num_choices - 1
        end
      when KEYS::ESCAPE then
        return nil
      when KEYS::LOWER_E then
        return @values[@index]
      end
    end
  end

  def display
    @num_choices.times do |i|
      Curses.setpos((i)+@row, @col)
      Curses.addstr("    ")
      Curses.addstr("#{@choices[i]}")
    end

    # this is the indicator for currently selected item
    Curses.setpos(@index+@row, @col)
    Curses.addstr("-->")
    # refresh the display
    Curses.refresh
  end

end