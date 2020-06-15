
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
    ui.choice_prompt(3, 0, messages[:next_or_quit], "nq")
  end

  def handle_choice(choice)
    case choice
    when "n" then
      render(:page2)
    when "q" then
      @game.set_screen(QuitScreen)
    end
  end

end