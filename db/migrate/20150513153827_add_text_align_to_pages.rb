class AddTextAlignToPages < ActiveRecord::Migration
  def change
    add_column :pages, :text_align, :string
  end
end
