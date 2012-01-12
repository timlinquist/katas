class MultiplesCalculator
  def self.sum_below_1k
    _1k = (1...1000).to_a

    _1k.inject(0) do |sum, n|
      if multiple_of_three_or_five? n
        sum + n
      else
        sum
      end
    end
  end

  def self.multiple_of_three_or_five? number
    (number % 3) == 0 || (number % 5) == 0
  end
end
