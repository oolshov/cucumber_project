module GooglePages
  class GoogleMainPage < SitePrism::Page
    set_url 'google.com'

    element :search_field, "#lst-ib"

  end
end