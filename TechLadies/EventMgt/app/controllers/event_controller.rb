class EventController < ApplicationController
  before_action :find_id, only: [:edit, :update, :destroy, :show]
  before_filter :authorize, only: [:index]
   
  def home
    @events = Event.all.sort_by &:date 
    if params[:search]
      @events = Event.search(params[:search])
    end
  end

  def contact
  end
  
  def show
    find_id 
  end
  
  def index
    @events = Event.all.sort_by &:date
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Record successfully created"
      redirect_to :action => 'index'
    else
      render :action => "new"
    end
  end
  
  def edit
    find_id
  end
  
  def update
    find_id
    if @event.update(event_params)
      flash[:success] = "Record successfully updated"
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    find_id
    @event.destroy
    flash[:success] = "Record successfully deleted"
    redirect_to :action => 'index' 
  end
  
  private
  
  def find_id
    @event = Event.find(params[:id])
  end
  
  def event_params
    params.require(:event).permit(:title, :description, :image, :date)
  end

end
