class AddAttachmentImageToOptions < ActiveRecord::Migration
  def self.up
    change_table :options do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :options, :image
  end
end
