def active_for_menu_item(menu_item_symbol)
  'active' if menu_item_active?(menu_item_symbol)
end

def menu_item_active?(menu_item_symbol)
  content_for(:active_menu_item)[0].call == menu_item_symbol
end

def active_menu_item!(menu_item_symbol)
  content_for(:active_menu_item, menu_item_symbol)
end
