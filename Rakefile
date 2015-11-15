# https://gist.github.com/kalmbach/4471560
# Thank You - kalmbach
namespace :db do
  require "sequel"
  Sequel.extension :migration
  DB = Sequel.sqlite("base.db")
  
  desc "Prints current schema version"
  task :version do    
    version = if DB.tables.include?(:schema_info)
      DB[:schema_info].first[:version]
    end || 0

    puts "Schema Version: #{version}"
  end

  desc "Perform migration up to latest migration available"
  task :migrate do
    Sequel::Migrator.run(DB, "migrations")
    Rake::Task['db:version'].execute
  end
    
  desc "Perform rollback to specified target or full rollback as default"
  task :rollback, :target do |t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB, "migrations", :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc "Perform migration reset (full rollback and migration)"
  task :reset do
    Sequel::Migrator.run(DB, "migrations", :target => 0)
    Sequel::Migrator.run(DB, "migrations")
    Rake::Task['db:version'].execute
  end    
end

namespace :git do 
  task :default => :st
  desc "Print git status"
  task :st do
    system("git status")
  end
  
  desc "pull from github"
  task :pull do
    system("git pull github master")
  end
  
  desc "push to github"
  task :push do
    system("git push github master")
  end
  
  
end
