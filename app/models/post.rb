class Post < ActiveRecord::Base

before_save :title_format

validates :title, presence: true
validates :body, presence: true, length: { maximum: 10000 }


	private

	def title_format
      self.title = title.titleize
    end
end
