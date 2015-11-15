Sequel.migration do
  change do
    create_table(:pages) do
      primary_key :id
      String :title, :null=>false
      String :slug, :null=>false
      String :header
      String :body, :text => true
      DateTime :created_at
      DateTime :updated_at
      Integer :position
      FalseClass :visible, :default =>false
    end
  end
end
