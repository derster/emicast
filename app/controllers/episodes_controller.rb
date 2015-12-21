class EpisodesController < ApplicationController

	before_action :authenticate_admin!, except: [:show]
	before_filter :require_permission, except: [:show]
	before_action :find_emission
	before_action :find_episode, only: [:show, :edit, :update, :destroy]

	  def new
	    @episode = @emission.episodes.new
	  end

	  def create
	    @episode = @emission.episodes.new episode_params
	    if @episode.save
	      redirect_to emission_episode_path(@emission, @episode)
	    else
	      render 'new'
	    end
	  end

	  def show
	    @episodes = Episode.where(emission_id: @emission).order("created_at DESC").limit(10).reject{ |e| e.id == @episode.id}
	  end

	  def edit
	  end

	  def update
	    if @episode.update episode_params
	      redirect_to emission_episode_path(@emission, @episode), notice: "Episode was succesfully updated !"
	    else
	      render 'edit'
	    end
	  end

	  def destroy
	    @episode.destroy
	      redirect_to root_path
	  end

	  private

	  def episode_params
	    params.require(:episode).permit(:title, :description, :thumbnail, :mp3)
	  end
	  def find_emission
	    @emission = Emission.find(params[:emission_id])
	  end

	  def find_episode
	    @episode = Episode.find(params[:id])
	  end

	  def require_permission
	    @emission = Emission.find(params[:emission_id])
	    if current_admin.id != @emission.admin_id
	      redirect_to root_path, notice: "Vous êtes pas autoriser à acceder à cette page !"
	    end
	  end
end
