
require 'standalone_migrations'

Dir[File.expand_path("../models/*.rb", __dir__)].each { |file| require file }

StandaloneMigrations::Tasks.load_tasks
