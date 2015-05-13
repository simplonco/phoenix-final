class AddBlockColorToPages < ActiveRecord::Migration
  def change
    add_column :pages, :block_color, :string
  end
end
