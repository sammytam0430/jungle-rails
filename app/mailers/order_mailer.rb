class OrderMailer < ApplicationMailer

  def order_email(user, order)
    @user = user
    @order = order

    mail(to: @user.email, subject: "Order Confirmation #{order.id}")
  end

end
