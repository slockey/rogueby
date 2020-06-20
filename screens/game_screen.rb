
class GameScreen

  def initialize(game, ui, options)
    @game = game
    @ui = ui
    @options = options
    @messages = Messages[:game]
  end

  def render
    ui.clear
    ui.message(0, 0, messages[:title])
    handle_choice prompt
  end

  private

  attr_reader :ui, :options, :messages

  def prompt
    ui.choice_prompt(3, 0, "Press something [q,ESC]", [KEYS::LOWER_Q,KEYS::ESCAPE])
  end

  def handle_choice(choice)
    case choice
      when KEYS::LOWER_Q then
        @game.set_screen(QuitScreen)
      when KEYS::ESCAPE
        @game.set_screen(TitleScreen)
    end
  end

end