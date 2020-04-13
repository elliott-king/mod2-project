class Application < ActiveRecord::Base
    belongs_to :candidate 
    belongs_to :position
end
