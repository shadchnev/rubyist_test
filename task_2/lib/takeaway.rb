require 'rubygems'
require 'twilio-ruby'

ACCOUNT_SID = 'AC95850dcf83082ab4acbc5f33cf59e515'
AUTH_TOKEN = 'ac95dd3697b16ade304a95d5ca1a9e5f'


class Takeaway
  MENU = {pizza: 8, hamburger: 4.50, cheeseburger: 5, salad: 4, fries: 2.50}

  def place_order(order, expected_total)
    total = 0
    order.each {|item| 
      quantity = item[1] 
      dish = item[0]
      price = MENU[dish]
      total += quantity * price
    }
    if total == expected_total
      send_text("Your order is on the way")
    else 
      raise Exception "Expected total does not match actual total" 
    end
  end

  def send_text(message)
    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

    account = client.account
    text_message = account.sms.messages.create({:from => '+441865922057', :to => '07766778890', :body => message})
    puts message
  end

end
