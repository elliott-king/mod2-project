class Candidate < ActiveRecord::Base
    has_many :applications
    has_many :postions, through: :applications

    def apply(position)
        Application.create(candidate: self, position: position)
    end
end
