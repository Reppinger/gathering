class ProjectsPage
  include PageObject

  table(:projects, id: 'projects')

  def has_project_displayed?(project_name, total_size)
    projects_element.each do |row|
      return true if row_has_project?(row, project_name, total_size)
    end
    false
  end

  def row_has_project?(row, project_name, total_size)
    row['Project Name'].text == project_name && row['Total Project Size'].text == total_size
  end
end