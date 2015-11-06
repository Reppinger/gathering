When(/^I add a project named "([^"]*)" with the following tasks:$/) do |project_name, tasks|
  visit(CreateProjectPage) do |page|
    page.name = project_name
    tasks.hashes.each do |task|
      page.add_task task[:name], task[:velocity]
    end
    page.create_project
  end
end

Then(/^"([^"]*)" is created with a total size of (\d+)$/) do |expected_project_name, total_size|
  visit(ProjectsPage) do |page|
    expect(page.project_name).to eq(expected_project_name)
    expect(page.total_size).to eq(total_size)
  end
end