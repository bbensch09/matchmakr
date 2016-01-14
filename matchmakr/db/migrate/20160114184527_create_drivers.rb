class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
    	t.string :first_name, :null => false
    	t.string :last_name, :null => false
    	t.belongs_to :user, index:true
      t.timestamps null: false
    end
  end
end
