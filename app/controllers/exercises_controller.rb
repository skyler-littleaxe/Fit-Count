class ExercisesController < ApplicationController

  # GET: /exercises
  get "/exercises" do
    redirect_if_not_logged_in
    @exercises = current_user.exercises
    erb :"/exercises/index.html"
  end

  # GET: /exercises/new
  get "/exercises/new" do
    redirect_if_not_logged_in
    @exercise = Exercise.new
    erb :"/exercises/new.html"
  end

  # POST: /exercises
  post "/exercises" do
    redirect_if_not_logged_in
    @exercise = current_user.exercises.build(exercise_name: params[:exercise][:exercise_name], exercise_notes: params[:exercise][:exercise_notes], sets: params[:exercise][:sets], reps: params[:exercise][:reps], lbs: params[:exercise][:lbs])
    if @exercise.save
      redirect "/exercises"
    else
      erb :"/exercises/new.html"
    end
  end

  # GET: /exercises/5
  get "/exercises/:id" do
    set_exercise
    erb :"/exercises/show.html"
  end

  # GET: /exercises/5/edit
  get "/exercises/:id/edit" do
    set_exercise
    redirect_if_not_authorized
    erb :"/exercises/edit.html"
  end

  # PATCH: /exercises/5
  patch "/exercises/:id" do
    set_exercise
    redirect_if_not_authorized
    if @exercise.update(exercise_name: params[:exercise][:exercise_name], exercise_notes: params[:exercise][:exercise_notes], sets: params[:exercise][:sets], reps: params[:exercise][:reps], lbs: params[:exercise][:lbs])
      flash[:success] = "Exercise successfully updated"
      redirect "/exercises/#{@exercise.id}"
    else
      erb :"exercises/edit.html"
    end
  end

  # DELETE: /exercises/5 - destroy
  delete "/exercises/:id" do
    set_exercise
    redirect_if_not_authorized
    @exercise.destroy
    redirect "/exercises"
  end

  private 

  def set_exercise
    @exercise = Exercise.find_by_id(params[:id])
    if @exercise.nil?
      flash[:error] = "Couldn't find a Post with id: #{params[:id]}"
      redirect "/exercises"
    end
  end

  def redirect_if_not_authorized
    redirect_if_not_logged_in
    if !authorize_lifter(@exercise)
      flash[:error] = "You don't have permission to do that action"
      redirect "/exercise"
    end
  end

  def authorize_lifter(exercise)
    current_user == exercise.lifter
  end
end
