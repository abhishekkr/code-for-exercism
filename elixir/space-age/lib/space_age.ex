defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds), do: do_age_on(planet, seconds) |> Float.round(3)
  defp do_age_on(:earth, seconds), do: seconds / 31557600
  defp do_age_on(:mercury, seconds), do: seconds / 7600543.81992
  defp do_age_on(:venus, seconds), do: seconds / 19414149.052176
  defp do_age_on(:mars, seconds), do: seconds / 59354032.690079994
  defp do_age_on(:jupiter, seconds), do: seconds / 374355659.124
  defp do_age_on(:saturn, seconds), do: seconds / 929292362.8848
  defp do_age_on(:uranus, seconds), do: seconds / 2651370019.3296
  defp do_age_on(:neptune, seconds), do: seconds /5200418560.032001
end
