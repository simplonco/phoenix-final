class Page < ActiveRecord::Base

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)  #/\Aimage\/.*\Z/
 validates_attachment :image,
 :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
 :size => { :in => 0..50000.kilobytes }

	 before_save :create_slug

	 def create_slug
	 	self.slug = name.parameterize
	 end

end
