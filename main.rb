
$LOAD_PATH.unshift "."  # makes requiring files easier

# gem includes
require "pp"
require "curses"  # require curses gem
require "yaml"

# local includes
require "ui"
require "game"
require "data_loader"
require "messages"

require "screens/title_screen"
require "screens/quit_screen"
require "screens/creation_screen"
require "screens/tutorial_screen"

# start the game
Game.new.run
