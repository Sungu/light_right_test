class HomeController < ApplicationController
  def index
  end
  
  def save_user
    a = User.create(f_name: params[:f_name],
                l_name: params[:l_name],
                nation: params[:nation],
                age: params[:age],
                sex: params[:sex])
    redirect_to "/home/intro/#{a.id}"
  end
  
  def intro
    @user_id = params[:id]
  end
  
  def ex
    @user_id = params[:id]
    
    if params[:num] == nil
      @num = 1
    else
      @num = params[:num].to_i + 1
    end
  end
  
  def save_q
    @user_id = params[:id]
    
    Question.create(user_id: params[:id],
                    question_num: params[:num],
                    iden: params[:iden],
                    good: params[:goodness])
    if params[:num].to_i == 20
      redirect_to "/home/thank"
    else
      redirect_to controller: 'home', action: 'ex', id: @user_id, num: params[:num].to_i
    end
  end
  
  def thank
  end
  
end
