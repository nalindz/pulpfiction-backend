class Block < ActiveRecord::Base
  attr_accessible :text, :block_number, :story
  belongs_to :story
end
