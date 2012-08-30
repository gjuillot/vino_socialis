class ConversationsController < ApplicationController
  
  load_resource
  
  def index
    @conversations = current_user.mailbox.inbox
  end
  
  def show
    @receipts = current_user.mailbox.receipts_for(@conversation).not_trash
    render :action => :show
    @receipts.mark_as_read
  end
  
  def new
    @user = User.find(params[:user])
  end
  
  def create
    @user = User.find(params[:user])
    current_user.send_message(@user, params[:body], params[:subject])
    redirect_to @conversation, notice: "Message was successfully sent to #{@user.name}."
  end

  def update
    if params[:reply_all].present?
      last_receipt = current_user.mailbox.receipts_for(@conversation).last
      current_user.reply_to_all(last_receipt, params[:body])
    end
    redirect_to :action => :show
  end
  
  def destroy
     @conversation.move_to_trash current_user
     redirect_to conversations_path
  end
end
