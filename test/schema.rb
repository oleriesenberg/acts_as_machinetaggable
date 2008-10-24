ActiveRecord::Schema.define :version => 0 do
  create_table :machinetags, :force => true do |t|
    t.column :name, :string
    t.column :machinetaggings_count, :integer, :default => 0, :null => false
  end
  add_index :machinetags, :name 
  add_index :machinetags, :machinetaggings_count

  create_table :machinetaggings, :force => true do |t|
    t.column :machinetag_id, :integer
    t.column :machinetaggable_id, :integer
    t.column :machinetaggable_type, :string
    t.column :user_id, :integer
  end
  add_index :machinetaggings, [:machinetag_id, :machinetaggable_type] 
  add_index :machinetaggings, [:user_id, :machinetag_id, :machinetaggable_type]
  add_index :machinetaggings, [:machinetaggable_id, :machinetaggable_type] 
  add_index :machinetaggings, [:user_id, :machinetaggable_id, :machinetaggable_type]
  
  create_table :things, :force => true do |t|
    t.column :name, :string
  end
  
  create_table :users, :force => true do |t|
    t.column :username, :string
  end
end