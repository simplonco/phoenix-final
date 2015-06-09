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

	 before_save :default_values

	  def default_values
	    if self.text_align.blank? == true 
	    	self.text_align ||= "left"
	    end
	    
	    if self.block_color.blank? == true 
	    	self.block_color ||= "bg_white"
	    end
	  end

end
