class GooglePage
  include PageObject

    text_field(:search_bar, :id => "lst-ib")
    button(:search, :value => "Google Search")
end
