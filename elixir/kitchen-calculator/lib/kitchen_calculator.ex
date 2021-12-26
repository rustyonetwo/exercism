defmodule KitchenCalculator do

  @milliliter_volume 1
  @cup_volume 240
  @fluid_ounce_volume 30
  @teaspoon_volume 5
  @tablespoon_volume 15

  def get_volume({_atom, volume}), do: volume

  def to_milliliter({:cup, quantity}) do
        {:milliliter, quantity * @cup_volume}
  end

  def to_milliliter({:fluid_ounce, quantity}) do
        {:milliliter, quantity * @fluid_ounce_volume}
  end

  def to_milliliter({:teaspoon, quantity}) do
        {:milliliter, quantity * @teaspoon_volume}
  end

  def to_milliliter({:tablespoon, quantity}) do
        {:milliliter, quantity * @tablespoon_volume}
  end

  def to_milliliter({:milliliter, quantity}) do
        {:milliliter, quantity * @milliliter_volume}
  end

  def from_milliliter({:milliliter, quantity}, :cup) do
        {:cup, quantity / @cup_volume}
  end

  def from_milliliter({:milliliter, quantity}, :fluid_ounce) do
        {:fluid_ounce, quantity / @fluid_ounce_volume}
  end

  def from_milliliter({:milliliter, quantity}, :teaspoon) do
        {:teaspoon, quantity / @teaspoon_volume}
  end

  def from_milliliter({:milliliter, quantity}, :tablespoon) do
        {:tablespoon, quantity / @tablespoon_volume}
  end

  def from_milliliter({:milliliter, quantity}, :milliliter) do
        {:milliliter, quantity / @milliliter_volume}
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
