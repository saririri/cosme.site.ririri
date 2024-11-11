class TweetsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

def index
  @tweets = Tweet.all
  if params[:tag_ids]
    @tweets = []
    params[:tag_ids].each do |key, value|      
      @tweets += Tag.find_by(name: key).tweets if value == "1"
    end
    @tweets.uniq!
  end
      #書き換える部分ここから
      if params[:search] == nil
        @tweets= Tweet.all
      elsif params[:search] == ''
        @tweets= Tweet.all
      else
        #部分検索
        @tweets = Tweet.where("text LIKE ? ",'%' + params[:search] + '%')
      end
      #ここまで
      if params[:tag]
        Tag.create(name: params[:tag])
      end

  end
    

    def new
        @tweet = Tweet.new
    end
    
    def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end


    def show
        @tweet = Tweet.find(params[:id])
    end
      
    def edit
      @tweet = Tweet.find(params[:id])
    end
    
    
    def update
      tweet = Tweet.find(params[:id])
      if tweet.update(tweet_params)
        redirect_to :action => "index", :id => tweet.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy
      redirect_to action: :index
  end

    def top
    end

    private
    def tweet_params
        params.require(:tweet).permit(:name, :genre, :text, :image, tag_ids: [])
    end

end
