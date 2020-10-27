require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride 
use AnimesController
use UsersController
run ApplicationController

#The purpose of config.ru is to detail to Rack the environment requirements of the application and start the application.
# This inheritance transforms our plain old Ruby class into a web application by giving it a Rack-compatible interface through inheriting from the "base" of the Sinatra framework. 