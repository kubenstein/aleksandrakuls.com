def expect_active_menu_item_to_be(desired_menu_item)
  within find('.menu .active') do
    expect(page.body).to have_content desired_menu_item
  end
end
