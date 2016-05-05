$LOAD_PATH.unshift File.expand_path '../../lib', __FILE__

require "record_list/console"
require_relative '../config'
require "rack"

run RecordController::API
