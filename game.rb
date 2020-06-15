
class Game
  
  def initialize
    @ui = UI.new
    @screen = nil
    @options = { quit: false, randall: false }  # variable for options
    at_exit { ui.close; pp options }            # runs at program exit
  end

  def run
    set_screen(TitleScreen)
  end

  def set_screen(screen)
    @screen = screen.new(self, ui, options)
    @screen.render
    quit?
  end

  private
  
  attr_reader :ui, :options   # add attr_reader for options
  
  def quit?
    exit if options[:quit]
  end

end