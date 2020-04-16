class Application < ActiveRecord::Base
    belongs_to :candidate 
    belongs_to :position

    validate :no_duplicates, on: :create

    private 
    def no_duplicates
        if self.candidate.positions.include? self.position 
            errors.add(:candidate, "should not apply to the same position twice.")
        end
    end
end
