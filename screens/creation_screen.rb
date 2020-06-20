
class CreationScreen

  def initialize(game, ui, options)
    @game = game
    @ui = ui
    @options = options
    @messages = Messages[:creation]
  end

  def render
    ui.clear
    ui.message(0, 0, messages[:title])
    handle_choice prompt
  end

  private

  attr_reader :ui, :options, :messages

  def prompt
    ui.choice_prompt(3, 0, messages[:text], [KEYS::LOWER_Q])
  end

  def handle_choice(choice)
    case choice
      when KEYS::LOWER_Q then
        @game.set_screen(QuitScreen)
    end
  end

end