class Camper < ApplicationRecord
    has_many :signups, dependent: :destroy
    has_many :activities, through: :signups

    validates_uniqueness_of :name
    validates_inclusion_of :age, in: 8..18

    def activity_at(time)
        s = self.signups.find{ |s| s.time == time }
        if s  
            Activity.find(s.activity_id).name
        end
    end
end
