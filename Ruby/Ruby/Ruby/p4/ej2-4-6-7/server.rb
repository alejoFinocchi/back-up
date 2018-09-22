require 'bundler'
Bundler.require

require_relative 'mol'
require_relative 'ejseis'
require_relative 'ejsiete'

use EjSiete
use EjSeis


get '/' do
	'Hol aaa 32 3 asdsa sdas 3 3'
end
