class Account < ApplicationRecord
  validates :owner, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: 0.0, message: ' Insufficient balance.' }

  attr_accessor :http_code

  def update_balance(value)
    if value > 0
      self.balance += value
      self.http_code = '200'
    elsif value < 0
      if self.balance >= value
        self.balance += value
        self.http_code = '200'
      else
        self.errors.add(:balance, ': insufficient funds.')
        self.http_code = '422'
      end
    else
      self.errors.add(:base, ": Value can't be 0.")
      self.http_code = '422'
    end
    self.http_code
  end
end
