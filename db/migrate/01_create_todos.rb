class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :todo 
      t.boolean :iscompelete 
    end
  end
end