class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :option_key
      t.string :option_value

      t.timestamps null: false
    end
  end
end
