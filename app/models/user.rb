class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_one_attached :profile_image
         has_many :books
        
        validates:name,length: { minimum: 2 }
    
      def get_profile_image(width = 100, height = 100)
           file_path = Rails.root.join('app/assets/images/no_image.jpg')
        unless profile_image.attached?
            profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
        end
        profile_image.variant(resize_to_limit: [width, height]).processed
      end
end
