class Post < ActiveRecord::Base
validates :title, presence: true
validates :body, presence: true, length: { maximum: 10000 }

end
