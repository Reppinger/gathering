class CreateProjectPage
  include PageObject

  page_url 'http://localhost:3000/projects'

  text_field(:name, id: 'project_name')

  def add_task(name, size)

  end

end