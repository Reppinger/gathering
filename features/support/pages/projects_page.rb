class ProjectsPage
  include PageObject

  table(:projects, id: 'projects')


  def first_project
    projects_element[1].text
  end
end