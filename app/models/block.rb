class Block < ActiveRecord::Base
  attr_accessible :text, :block_number
  belongs_to :story
end
