class Admin::ItemController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(title: params["title"], description: params["description"], price: params["price"].to_f)
    @item.cat.attach(params[:cat])
    puts "image postée !"
    puts @item.errors.full_messages
    redirect_to request.referrer
  end

  private
  def check_if_admin
    unless current_user.admin?
     redirect_to root_path
   end
 end
end
