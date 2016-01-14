class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
    	t.string :first_name, :null => false
    	t.string :last_name, :null => false
    	t.integer :age
    	t.string :gender
    	t.text :interests
    	t.belongs_to :user, index:true
      t.timestamps null: false
    end
  end
end
