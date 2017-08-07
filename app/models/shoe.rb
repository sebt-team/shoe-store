class Shoe < ApplicationRecord
	has_attached_file :picture, styles: { medium: '300x300>', thumb: '100x100>' },
		default_url: '/images/:style/missing.png'

	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

	belongs_to :brand

  def self.search(search)
    if search
      where('model LIKE ?', "%#{search}%")
      # find(:all, :conditions => ['model LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
