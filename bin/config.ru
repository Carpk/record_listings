$LOAD_PATH.unshift File.expand_path '../../lib', __FILE__

require "record_list/console"
require "rack"

run Routes::API
