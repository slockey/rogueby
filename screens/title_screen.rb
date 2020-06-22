
class TitleScreen

  KEYS_TITLE = [KEYS::LOWER_P, KEYS::LOWER_T, KEYS::LOWER_Y, KEYS::LOWER_N, KEYS::LOWER_Q]

  MENU_TEXT   = ["Play", "Tutorial", "Quit"]
  MENU_VALUES = [KEYS::LOWER_P, KEYS::LOWER_T, KEYS::LOWER_Q]

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
#    handle_choice prompt
    handle_choice Menu.start(@ui, MENU_TEXT, MENU_VALUES, 5, 5)
  end

  private

  attr_reader :ui, :options, :messages

  def prompt
    ui.choice_prompt(3, 0, messages[:pick_random], KEYS_TITLE)
  end

  def handle_choice(choice)
    case choice
      when KEYS::LOWER_Q then
        @game.set_screen(QuitScreen)
      when KEYS::LOWER_N then
        @game.set_screen(CreationScreen)
      when KEYS::LOWER_Y then 
        options[:randall] = true
      when KEYS::LOWER_T then
        @game.set_screen(TutorialScreen)
      when KEYS::LOWER_P then
        @game.set_screen(GameScreen)
    end
  end

end