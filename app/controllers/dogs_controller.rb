class DogsController < ApplicationController
    def index
    end
  
    def new
      @dog = Dog.new
    end
  
    def show
      @dog = Dog.find_by(id: params[:id])
    end
  
    def create
      @dog = Dog.new(dog_params)
      params[:dog][:question] ? @dog.question = params[:dog][:question].join("") : false
      if @dog.save
          flash[:notice] = "診断が完了しました"
          redirect_to dog_path(@dog.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def dog_params
        params.require(:dog).permit(:id, question: [])
    end
end
