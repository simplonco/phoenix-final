class AddTitleMapToPages < ActiveRecord::Migration
  def change
    add_column :pages, :title_map, :string
  end
end
