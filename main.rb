
$LOAD_PATH.unshift "."  # makes requiring files easier

# gem includes
require "pp"
require "curses"  # require curses gem
require "yaml"

# local includes
require "ui"
require "game"
require "title_screen"
require "data_loader"
require "messages"

# start the game
Game.new.run
