class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :host_name, :null => true 
    	t.string :host_email, :null => true
    	t.integer :numgsts, :null => true
    	t.text :guest_names, :null => true
    	t.string :venue, :null => true
    	t.string :location, :null => true
    	t.string :theme, :null => true
    	t.datetime :starts_at, :null => true
    	t.datetime :ends_at, :null => true
    	t.text :descript, :null => true
    	t.timestamps null: false
    end
  end
end