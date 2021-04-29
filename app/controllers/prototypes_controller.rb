class PrototypesController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show, :user, :create, :sign_in]
  before_action :move_to_index, expect: [:index, :show]
  
  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def show
    @prototype = Prototype.show(prototype_params)
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @prototype = Prototype.edit(prototype_params)
  end

  def destroy
    @prototype = Prototype.find(prototype_params)
    @prorotype.destroy
  end


  def updated
    @prototype = prototype.find(prototype_params)
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_sign_in?
      redirect_to action: :index
    end
  end
end
