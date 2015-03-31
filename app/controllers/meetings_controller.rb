class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @meetings = Meeting.all
    respond_with(@meetings)
  end

  def show
    respond_with(@meeting)
  end

  def new
    @meeting = Meeting.new
    respond_with(@meeting)
  end

  def edit
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.save
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to root_path }
        format.json { render json: @meeting, status: :created, location: @meeting }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @meeting.update(meeting_params)
    @meeting.save
    respond_to do |format|
     if @meeting.save
        format.html { redirect_to root_path }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @meeting.destroy
    respond_with(@meeting)
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :starts_at, :end_at, :address)
    end
end
