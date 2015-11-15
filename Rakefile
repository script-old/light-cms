# https://gist.github.com/kalmbach/4471560
# Thank You - kalmbach
task :default => "git:st"
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
  
  desc "commit"
  task :commit do
    puts "Enter text"
    system("git commit")
  end
  
  desc "adding all files - e.g. git add ."
  task :add do
    system("git add .")
  end
  
  desc "fast stop"
  task :fin => ["git:add" ,"git:commit"] do
    puts Time.now
  end
  
  desc "stop & finish for session"
  task :stop => ["git:fin", "git:push"] do
  
  end
  
  
end
