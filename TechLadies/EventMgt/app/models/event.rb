class Event < ActiveRecord::Base
  
  validates :title, :description, :presence=> true	
  validates :title, :uniqueness => {:message => "already exists!"}
	validate :validate_date 
  validate :image_available
  
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :normal => "400x700>" }
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

	def validate_date
		if date < Time.new
			errors.add(:date, "can't be in the past")
		end
	end  
  
  def image_available
    errors.add(:base, 'Please upload an image related to the event') if !image.present?
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
  
end
