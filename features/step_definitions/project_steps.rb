When(/^I add a project named "([^"]*)" with the following tasks:$/) do |project_name, tasks|
  visit(CreateProjectPage) do |page|
    page.name = project_name
    tasks.hashes.each do |task|
      page.add_task task[:name], task[:size]
    end
    page.create_project
  end
end

Then(/^"([^"]*)" is created with a total size of (\d+)$/) do |project_name, total_size|
  visit(ProjectsPage) do |page|
    expect(page).to have_project_displayed(project_name, total_size)
  end
end