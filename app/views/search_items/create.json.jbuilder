if @search_item.persisted?
  json.form render(partial: "search_items/form", formats: :html, locals: { search_item: SearchItem.new, ip: @ip })
  json.inserted_item render(partial: "search_items/search_item", formats: :html, locals: { search_item: @search_item })
else
  json.form render(partial: "search_items/form", formats: :html, locals: { search_item: @search_item })
end