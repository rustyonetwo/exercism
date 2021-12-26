defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.00
  end

  def apply_discount(before_discount, discount) do
    before_discount * ((100 - discount) / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    rate = hourly_rate
    |> apply_discount(discount)
    |> daily_rate()

    ceil(rate * 22)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    rate = apply_discount(hourly_rate, discount) * 8.0
    Float.floor(budget / rate, 1)
  end
end
