class CreatesProject

  DEFAULT_TASK_SIZE = 1

  attr_accessor :name, :project, :task_string

  def initialize(name: '', task_string: '')
    @name = name
    @task_string = task_string
  end

  def build
    self.project = Project.new(name: name)
    project.tasks = convert_string_to_tasks
  end

  def convert_string_to_tasks
    tasks = []
    task_string.split('\n').each do |one_task|
      tasks << build_task(one_task)
    end
    tasks
  end

  def build_task(task_string)
    task_components = task_string.split(':')
    task_title = task_components[0]
    task_size = task_components[1] || DEFAULT_TASK_SIZE
    Task.new(title: task_title, size: task_size)
  end

  def create
    build
  end

end