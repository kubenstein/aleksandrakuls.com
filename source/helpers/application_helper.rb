def active_for_menu_item(menu_item_symbol)
  'active' if menu_item_active?(menu_item_symbol)
end

def menu_item_active?(menu_item_symbol)
  current_page.data.active_menu_item.to_s.to_sym == menu_item_symbol
end