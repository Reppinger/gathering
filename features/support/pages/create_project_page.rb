class CreateProjectPage
  include PageObject

  page_url 'http://localhost:3000/projects/new'

  text_field(:name, id: 'project_name')
  text_area(:tasks, id: 'project_tasks')
  button(:create_project, name: 'commit')

  def add_task(name, size)
    self.tasks += "#{name} #{size}\n"
  end

end