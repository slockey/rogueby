
class QuitScreen

  def initialize(game, ui, options)
    @game = game
    @ui = ui
    @options = options
    @messages = Messages[:quit]
  end

  def render
    ui.clear
    ui.message(0, 0, messages[:title])
    handle_choice prompt
  end

  private

  attr_reader :ui, :options, :messages

  def prompt
    ui.choice_prompt(3, 0, messages[:prompt], "yn")
  end

  def handle_choice(choice)
    case choice
      when "y" then options[:quit] = true
    end
  end

end