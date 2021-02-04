class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination
    validates :content, :presence => true, length: {minimum: 100}
end
