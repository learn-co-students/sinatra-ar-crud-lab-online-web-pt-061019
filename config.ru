
require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride # middle-ware, changes post to a patch method  

  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
