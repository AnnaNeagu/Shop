
json.id @order.id

json.total @order.total
json.guid @order.guid
json.time @order.created_at.strftime(" %m/%d/%Y, %I:%M%p")
json.subtotal @order.subtotal
json.discount @order.discount.name

json.name @order.order_items.name

json.name @name
json.price @price

