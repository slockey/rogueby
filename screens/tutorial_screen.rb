
class TutorialScreen

  def initialize(game, ui, options)
    @game = game
    @ui = ui
    @options = options
    @messages = Messages[:tutorial]
  end

  def render(msg = :page1)
    ui.clear
    ui.message(0, 0, messages[msg])
    handle_choice prompt
  end

  private

  attr_reader :ui, :options, :messages

  def prompt
    ui.choice_prompt(3, 0, messages[:next_or_quit], [KEYS::LOWER_N, KEYS::LOWER_Q])
  end

  def handle_choice(choice)
    case choice
    when KEYS::LOWER_N then
      # TODO: implement a better paging for messages
      render(:page2)
    when KEYS::LOWER_Q then
      @game.set_screen(QuitScreen)
    end
  end

end