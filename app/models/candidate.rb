class Candidate < ActiveRecord::Base
    has_many :applications
    has_many :positions, through: :applications

    validates :name, :gpa, :education_level, :native_language, presence: true
    validates :gpa, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5.5}

    has_secure_password

    def apply(position)
        Application.create(candidate: self, position: position)
    end


end
