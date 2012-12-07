class Block < ActiveRecord::Base
  attr_accessible :text, :block_number, :story, :first_block, :last_block, :total_start_index
  belongs_to :story
end
