class ProjectsPage
  include PageObject

  td(:project_name, id: 'project_name')
  td(:total_size, id: 'total_size')

end