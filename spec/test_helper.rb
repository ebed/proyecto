Capybara.add_selector(:name) do
  xpath { |name| XPath.descendant[XPath.attr(:name).contains(name)] }
end
