require_relative 'middleware/runtime'
require_relative 'middleware/logger'
require_relative 'middleware/path'
require_relative 'middleware/time'
require_relative 'app'

use Runtime
use AppLogger , logdev: File.expand_path('log/app.log', __dir__)
use Timer
use Path
run App.new
