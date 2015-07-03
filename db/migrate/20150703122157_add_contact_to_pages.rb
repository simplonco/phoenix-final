class AddContactToPages < ActiveRecord::Migration
  def change
    add_column :pages, :contact, :string
  end
end
