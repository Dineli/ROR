class EventController < ApplicationController
  before_action :find_id, only: [:edit, :update, :destroy, :show]
   
  def home
    @events = Event.all.sort_by &:date 
    if params[:search]
      @events = Event.search(params[:search])
      if @events.size.zero?
        flash.now[:notice] = "No result found for the search key word '#{params[:search]}'" 
      end
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
      flash[:notice] = "Record successfully created"
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
      flash[:notice] = "Record successfully updated"
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    find_id
    @event.destroy
    flash[:notice] = "Record successfully deleted"
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
