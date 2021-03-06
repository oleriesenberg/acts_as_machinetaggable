
namespace :acts_as_machinetaggable do 
  namespace :db do  
 	  desc "Creates tag tables for use with acts_as_machinetaggable" 
    task :create => :environment do 
      require 'rails_generator' 
      require 'rails_generator/scripts/generate'
      raise "Task unavailable to this database (no migration support)" unless ActiveRecord::Base.connection.supports_migrations? 
      Rails::Generator::Scripts::Generate.new.run([ "acts_as_machinetaggable_tables", "add_acts_as_machinetaggable_tables" ])
    end 
  end
  
  namespace :stylesheet do
    desc "Create tag stylesheet for use with acts_as_machinetaggable"
    task :create => :environment do
      require 'rails_generator' 
      require 'rails_generator/scripts/generate'
      Rails::Generator::Scripts::Generate.new.run([ "acts_as_machinetaggable_stylesheet" ])
    end
  end
end
