class TaskManager < Sinatra::Base
  get '/tasks' do
    @tasks = Task.all
    erb :tasks_index
  end

  post '/tasks' do
    task = Task.new(params[:task])

    if task.save
      body "Successfully created"
    else
      body task.errors.full_messages.first
      status 400
    end
  end

end
