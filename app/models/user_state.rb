module UserState
  CONFIRMED_USERNAME = 0
  attr_accessor :confirmed_username

  def confirmed_username
    state[CONFIRMED_USERNAME]
  end

  def confirmed_username=(confirmed_username_state)
    puts 'state: ', state
    puts 'confirmed_username_state: ', confirmed_username_state
    set_bit(state, CONFIRMED_USERNAME, confirmed_username_state)
  end

  def is_bit_set?(number, bit_position)
    (1 << bit_position) & number
  end

  def set_bit(number, bit_position, bit_value)
    if (bit_value)
      self.state = self.state | (1 << bit_position)
    else
      self.state = self.state & ~(1 << bit_position)
    end
    save!
  end

end
