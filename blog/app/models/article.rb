class Article < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 5 }

end

#Validations are covered in detail in Active Record Validations. 
#(http://guides.rubyonrails.org/active_record_validations.html)