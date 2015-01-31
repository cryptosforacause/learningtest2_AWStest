class TransactionsController < ApplicationController

  def show
    @transaction=Transaction.new
  end

  def create
    if !(User.find_by(user_params).nil?)
      @user=User.find_by(user_params)
      @transaction=@user.transactions.build(transaction_params)
        if @transaction.save
          # flash[:success]="Transaction processing"
          # debugger
          redirect_to '/show'
        else
          # flash[:failure]="Transaction failed"
        end
    else
      @user=User.new(user_params)
      @user.save
      @transaction=@user.transactions.build(transaction_params)
        if @transaction.save
          # flash[:success]="Transaction processing"
          # debugger
          redirect_to '/show'
        else
        end    
    end
  end

  def dogedtester
    # create a new instance of the client
    client = DogecoinClient.new

    # check that dogecoind is running and that our credentials are correct
    if client.valid?
      # get a new wallet address
      new_wallet_addr = client.get_new_address

      # get the balance of our new wallet
      my_balance = client.get_balance(new_wallet_addr)
      @displayvar= "I have #{my_balance} doge!"
    else
      @displayvar= 'Something is wrong...'
    end
  end


    private
      def user_params
        params.require(:transaction).permit(:email)
      end

      def transaction_params
        params.require(:transaction).permit(:email, :crypto_quantity, :address)
      end

end
