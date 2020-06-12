
class Game
  
  def initialize
    @ui = UI.new
    @options = { quit: false, randall: false }  # variable for options
    at_exit { ui.close; pp options }            # runs at program exit
  end

  def run
    title_screen
  end

  private
  
  attr_reader :ui, :options   # add attr_reader for options
  
  def title_screen
    TitleScreen.new(ui, options).render
    quit?
  end

  def quit?
    exit if options[:quit]
  end

end