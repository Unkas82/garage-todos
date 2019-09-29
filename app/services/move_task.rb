class MoveTask
  def initialize(params)
    @task = Task.find_by(id: params[:task_id])
    @increment = params[:increment].to_i

    @tasks_row = tasks_row

    @small_row = small_row

    @prev_task_index = nil
  end

  def call
    move_up   if @increment.positive?
    move_down if @increment.negative?
  end

  private

  def move_up
    edge_index = @small_row.last.index

    @small_row.each do |task|
      set_index(task, edge_index)
    end
  end

  def move_down
    edge_index = @small_row.first.index

    @small_row.reverse_each do |task|
      set_index(task, edge_index)
    end
  end

  def set_index(task, edge_index)
    current_index = task.index

    if target_task(task.id)
      task.update(index: edge_index)
    else
      task.update(index: @prev_task_index)
    end
    @prev_task_index = current_index
  end

  def tasks_row
    @task.project.tasks.order(:index)
  end

  def small_row
    @tasks_row[indexes.min..indexes.max]
  end

  def indexes
    [current_relation_index, new_relation_index]
  end

  def current_relation_index
    @tasks_row.find_index(@task)
  end

  def new_relation_index
    [current_relation_index + @increment, 0].max
  end

  def target_task(task_id)
    task_id == @task.id
  end
end
