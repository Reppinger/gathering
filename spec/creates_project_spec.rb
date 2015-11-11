describe CreatesProject do

  it 'creates a project with a given name' do
    creator = CreatesProject.new(name: "Project Runway")
    creator.build
    expect(creator.project.name).to eq("Project Runway")
  end

  it 'attaches tasks to the project' do
    creator = CreatesProject.new(name: 'Test', task_string: "Start things:3\nEnd things:7")
    creator.create
    expect(creator.project.tasks.size).to eq(2)
  end

  xit "doesn't allow the creation of a task with and invalid size" do
    creator = CreatesProject.new(name: "Test", task_string: "task_with_invalid_size:invalid_size")
    creator.create
    # This doesn't feel right to me. Not in agreement on this validating the record wasn't saved
    # expect(creator.project.tasks.first.title).to eq("task_with_invalid_size")
  end

  describe 'converts the given string to tasks' do

    it 'when it is empty' do
      creator = CreatesProject.new(name: 'Test', task_string: "")
      tasks = creator.convert_string_to_tasks
      expect(tasks.size).to eq(0)
    end

    context 'when the string contains a single task' do
      let(:creator) { CreatesProject.new(name: 'Test', task_string: "Start things") }

      it 'creates a task' do
        tasks = creator.convert_string_to_tasks
        expect(tasks.size).to eq(1)
      end

      it 'assigns task title' do
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:title)).to eq(['Start things'])
      end

      it 'defaults a task size to 1' do
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:size)).to eq([1])
      end

      it 'parses out the provided size' do
        creator = CreatesProject.new(name: 'Test', task_string: "Start things:3")
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:size)).to eq([3])
      end
    end

    context 'when the string contains multiple tasks' do
      let(:creator) { CreatesProject.new(name: 'Test', task_string: "Start things\nEnd things") }

      it 'creates expected number of tasks' do
        tasks = creator.convert_string_to_tasks
        expect(tasks.size).to eq(2)
      end

      it 'assigns task title for each task' do
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:title)).to eq(['Start things', 'End things'])
      end

      it 'parses out the provided sizes' do
        creator = CreatesProject.new(name: 'Test', task_string: "Start things:3\nEnd things:7")
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:size)).to eq([3, 7])
      end
    end


  end
end