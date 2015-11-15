class Page < Sequel::Model
  plugin :list
  plugin :timestamps, :force=>true, :update_on_create=>true
end

