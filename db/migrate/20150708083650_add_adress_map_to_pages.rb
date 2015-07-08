class AddAdressMapToPages < ActiveRecord::Migration
  def change
    add_column :pages, :adress_map, :string
  end
end
