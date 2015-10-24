class EpisodesController < ApplicationController
	before_action :find_podcast
	before_action :find_episode, only: [:show, :edit, :update, :destroy]

	def new
		@episode = @podcast.episodes.new
	end

	def create
		@episode = @podcast.episodes.new episode_pararms
		if @episode.save
			redirect_to podcast_episode_path(@podcast, @episode)
		else
			render 'new'
		end
	end

	def show
		@episodes = Episode.where(podcast_id: @podcast).order("created_at DESC").reject { |e| e.id == @episode.id}
	end

	def edit
	end

	def update
		if @episode.update episode_pararms
			redirect_to podcast_episode_path(@podcast, @episode), notice: "Episode was successfully updated!"
		else
			render 'edit'
		end
	end

	private

	def episode_pararms
		params.require(:episode).permit(:title, :description)
	end

	def find_podcast
		@podcast = Podcast.find(params[:podcast_id])
	end

	def find_episode
		@episode = Episode.find(params[:id])
	end
end
