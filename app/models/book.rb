class Book < ApplicationRecord
    
     belongs_to :user
     has_one_attached:image
     
      validates :title, presence: true,length: { maximum: 20 }
      validates :body, presence: true,length: { maximum: 200 }
      
end

