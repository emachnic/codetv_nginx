class Entry < ActiveRecord::Base
  belongs_to :mood
  accepts_nested_attributes_for :mood
end
