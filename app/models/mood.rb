class Mood < ActiveRecord::Base
  has_many :entries
end
