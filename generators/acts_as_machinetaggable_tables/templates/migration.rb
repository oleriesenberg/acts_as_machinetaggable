class AddActsAsMachinetaggableTables < ActiveRecord::Migration  
  def self.up
    create_table :machinetags do |t|
      t.string :name, :limit => 128
      t.integer :machinetaggings_count, :default => 0, :null => false

      t.timestamps
    end
    
    create_table :machinetaggings do |t|
      t.integer :machinetag_id
      t.integer :machinetaggable_id
      t.string :machinetaggable_type, :limit => 32
      t.integer :user_id

      t.timestamps
    end
  
    add_index :machinetags, :name, :name => "index_mtags_on_name"
    add_index :machinetags, :machinetaggings_count, :name => "index_mtags_on_mtaggings_count"
    
    add_index :machinetaggings, [:machinetag_id, :machinetaggable_type], :name => "index_mtaggings_on_mtag_id_and_mtaggable_type"
    add_index :machinetaggings, [:user_id, :machinetag_id, :machinetaggable_type], :name => "index_mtaggings_on_user_id_and_mtag_id_and_mtaggable_type"
    add_index :machinetaggings, [:machinetaggable_id, :machinetaggable_type], :name => "index_mtaggings_on_mtaggable_id_and_mtaggable_type"
    add_index :machinetaggings, [:user_id, :machinetaggable_id, :machinetaggable_type], :name => "index_mtaggings_on_user_id_and_mtaggable_id_and_mtaggable_type"
  end


  def self.down 
    drop_table :machinetags 
    drop_table :machinetaggings 
  end 
end