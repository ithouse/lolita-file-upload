require 'active_record'
require 'logger'
dbconf = YAML::load(File.open('test_orm/config/active_record.yml'))
ActiveRecord::Base.establish_connection(dbconf)
ActiveRecord::Base.logger = Logger.new(File.open('test_orm/log/database.log', 'a'))
migrations = if ActiveRecord.version.version >= '5.2'
  ActiveRecord::Migration.new.migration_context.migrations
else
  ActiveRecord::Migrator.migrations('db/migrate')
end
ActiveRecord::Migrator.new(:up, migrations, nil).migrate
Dir[File.expand_path("test_orm/uploaders/**/*.*")].each do |path|
  require path
end
Dir[File.expand_path("test_orm/active_record/**/*.*")].each do |path|
  require path
end
