# frozen_string_literal: true

json.array! @orders do |order|
    json.extract! order, :id
    json.dish do
        json.extract! order.dish, :id, :name
    end
    json.menu do
        json.extract! order.menu, :id 
    end
end
