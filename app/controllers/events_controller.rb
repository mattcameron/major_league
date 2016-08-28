class EventsController < ApplicationController
  before_action :set_event, only: :show
  before_action :check_user_owns_event, only: [:edit, :update]

  def show
  end

  def edit
    @event = current_user.hosted_event
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Fuck yeah, this event is going to be awesome!'
    else
      render :edit
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def check_user_owns_event
    set_event
    if @event.host != current_user
      redirect_to inner_sanctum_path, flash: { danger: "What the hell do you think you're doing mate?" }
    end
  end

  def event_params
    params.require(:event).permit(
      :name,
      :event_date,
      :description,
      :address,
      :favourites,
      :image,
      :cover_image,
      :host_id,
    )
  end
end
