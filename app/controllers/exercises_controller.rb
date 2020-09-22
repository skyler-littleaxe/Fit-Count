class ExercisesController < ApplicationController

  # GET: /exercises
  get "/exercises" do
    @exercises = current_user.exercises
    erb :"/exercises/index.html"
  end

  # GET: /exercises/new
  get "/exercises/new" do
    @excercise = Exercise.new
    erb :"/exercises/new.html"
  end

  # POST: /exercises
  post "/exercises" do
    @exercise = current_user.exercises.build(exercise_name: params[:exercise][:exercise_name], exercise_notes: params[:exercise][:exercise_notes], sets: params[:exercise][:sets], reps: params[:exercise][:reps], lbs: params[:exercise][:lbs])
    if @exercise.save
      redirect "/exercises"
    else
      erb :"/exercises/new.html"
    end
  end

  # GET: /exercises/5
  get "/exercises/:id" do
    @exercise = Exercise.find(params[:id])
    erb :"/exercises/show.html"
  end

  # GET: /exercises/5/edit
  get "/exercises/:id/edit" do
    erb :"/exercises/edit.html"
  end

  # PATCH: /exercises/5
  patch "/exercises/:id" do
    redirect "/exercises/:id"
  end

  # DELETE: /exercises/5/delete
  delete "/exercises/:id/delete" do
    redirect "/exercises"
  end
end
