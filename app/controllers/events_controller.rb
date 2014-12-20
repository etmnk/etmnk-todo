class EventsController < ApplicationController
  before_action :authenticate, except: :show

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_event.build
  end

  def create
    @event = current_user.created_event.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      render :new
    end
  end

  def destroy
    @event = current_user.created_event.find(params[:id])
    @event.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :place, :content, :start_time, :end_time
    )
  end
end
