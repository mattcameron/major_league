class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  def update
    # check user owns event
  end

  private

  def event_params
    params.require(:event).permit(

    )
  end
end
