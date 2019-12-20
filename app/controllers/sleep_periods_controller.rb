class SleepPeriodsController < ApplicationController
  before_action :set_person
  before_action :set_sleep_period, only: %i[show update destroy]

  # GET /people/:person_id/sleep_periods
  def index
    json_response(@person.sleep_periods)
  end

  # GET /people/:person_id/sleep_periods/:id
  def show
    json_response(@sleep_period)
  end

  # POST /people/:person_id/sleep_periods
  def create
    @sleep_period = @person.sleep_periods.create!(sleep_period_params)
    json_response(@sleep_period, :created)
  end

  # PUT /people/:person_id/sleep_periods/:id
  def update
    @sleep_period.update!(sleep_period_params)
    json_response(@sleep_period, :ok)
  end

  # DELETE /people/:person_id/sleep_periods/:id
  def destroy
    @sleep_period.destroy
    head :no_content
  end

  private

  def sleep_period_params
    params.permit(:started_at, :ended_at, :quality, :notes)
  end

  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_sleep_period
    @sleep_period = @person.sleep_periods.find_by!(id: params[:id]) if @person
  end
end
