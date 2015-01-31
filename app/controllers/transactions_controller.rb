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

    private
      def user_params
        params.require(:transaction).permit(:email)
      end

      def transaction_params
        params.require(:transaction).permit(:email, :crypto_quantity, :address)
      end

end
