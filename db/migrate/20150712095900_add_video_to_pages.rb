class AddVideoToPages < ActiveRecord::Migration
  def change
    add_column :pages, :video, :string
  end
end
