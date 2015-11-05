class ProjectsPage
  include PageObject

  span(:project_name, id: 'project_name')
  span(:total_size, id: 'total_size')

end