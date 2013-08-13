class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title

      t.timestamps
    end

    add_reference :users, :role, index: true
  end
end
