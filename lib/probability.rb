require "probability/version"
require 'securerandom'

module Probability
  # Probability of number in another number.
  #
  #   1.in(10) => true   # about 10% of the time
  #   1.in(10) => false  # about 90% of the time
  #
  # You may also supply a block, which is only executed
  # if when the condition is true
  #
  #   3.in(10) do
  #     # Do something 30% of the time
  #   end
  def self.in(number, &block)
    raise RangeError, 'Probability cannot be less than 0.' if number <= 0.00
    return false if self.respond_to?(:to_f) == false

    threshold = self / number
    result = SecureRandom.random_number(0) <= threshold

    return yield if result && block_given?
    result
  end

end
