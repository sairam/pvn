module ApplicationHelper

  # any data we want to hide from spammers, since this reverse's the data
  def hide_from_spammer data
    %{<span class="hidemail">#{data.to_s.reverse}</span>}
  end

end