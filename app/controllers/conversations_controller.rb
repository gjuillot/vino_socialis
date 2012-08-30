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
    @users = [User.find(params[:user])]
    @admin_tag = ""
    @bug_page = ""
  end
  
  def admins
    @users = User.where('role = "admin"').all
    @admin_tag = "[Admin] "
    @bug_page = ""
    render :action => :new
  end
  
  def bug
    @users = User.where('role = "admin"').all
    @admin_tag = "[Bug] "
    @bug_page = params[:url]
    render :action => :new
  end
  
  def create
    @users = User.find(params[:users])
    
    if params[:admin_tag]
      params[:subject] = params[:admin_tag] + params[:subject]
    end
    if params[:page]
      params[:body] = params[:page] + '<br />' + params[:body]
    end
    
    current_user.send_message(@users, params[:body], params[:subject])
    redirect_to @conversation, notice: "Message was successfully sent."
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
