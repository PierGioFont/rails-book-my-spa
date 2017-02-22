module SpasHelper
  def stars(rating)
    full = rating.truncate
    half = (rating - full).round
    {
      full: full,
      half: half,
      empty: 5 - half - full
    }
  end
end
