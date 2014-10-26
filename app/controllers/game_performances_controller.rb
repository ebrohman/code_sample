class GamePerformancesController < ApplicationController
  # GET /game_performances
  # GET /game_performances.json
  def index
    @game_performances = GamePerformance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @game_performances }
    end
  end

  # GET /game_performances/1
  # GET /game_performances/1.json
  def show
    @game_performance = GamePerformance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game_performance }
    end
  end

  # GET /game_performances/new
  # GET /game_performances/new.json
  def new
    @game_performance = GamePerformance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game_performance }
    end
  end

  # GET /game_performances/1/edit
  def edit
    @game_performance = GamePerformance.find(params[:id])
  end

  # POST /game_performances
  # POST /game_performances.json
  def create
    @game_performance = GamePerformance.new(params[:game_performance])

    respond_to do |format|
      if @game_performance.save
        format.html { redirect_to @game_performance, notice: 'Game performance was successfully created.' }
        format.json { render json: @game_performance, status: :created, location: @game_performance }
      else
        format.html { render action: "new" }
        format.json { render json: @game_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /game_performances/1
  # PUT /game_performances/1.json
  def update
    @game_performance = GamePerformance.find(params[:id])

    respond_to do |format|
      if @game_performance.update_attributes(params[:game_performance])
        format.html { redirect_to @game_performance, notice: 'Game performance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_performances/1
  # DELETE /game_performances/1.json
  def destroy
    @game_performance = GamePerformance.find(params[:id])
    @game_performance.destroy

    respond_to do |format|
      format.html { redirect_to game_performances_url }
      format.json { head :no_content }
    end
  end
end
