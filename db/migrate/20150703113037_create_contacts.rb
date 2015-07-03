class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :mail
      t.string :object
      t.string :message

      t.timestamps null: false
    end
  end
end
