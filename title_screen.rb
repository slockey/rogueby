
class TitleScreen

  def initialize(game, ui, options)
    @game = game
    @ui = ui
    @options = options
    @messages = Messages[:title]
  end

  def render
    ui.clear
    ui.message(0, 0, messages[:name])
    ui.message(1, 7, messages[:by])
    ui.message(4, 0, messages[:tutorial])
    handle_choice prompt
  end

  private

  attr_reader :ui, :options, :messages

  def prompt
    ui.choice_prompt(3, 0, messages[:pick_random], "tynq")
  end

  def handle_choice(choice)
    case choice
      when "q" then
        @game.set_screen(QuitScreen)
      when "n" then
        @game.set_screen(CreationScreen)
      when "y" then 
        options[:randall] = true
      when "t" then
        @game.set_screen(TutorialScreen)
    end
  end

end