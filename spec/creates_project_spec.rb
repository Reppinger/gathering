require 'rails_helper'

describe CreatesProject do

  it 'should creates a project given a name' do
    creator = CreatesProject.new(name: "Project Runway")
    creator.build
    expect(creator.project.name).to eq("Project Runway")
  end

  it 'attaches tasks to the project' do
    creator = CreatesProject.new(name: 'Test', task_string: 'Start things:3\nEnd things:7')
    creator.create
    expect(creator.project.tasks.size).to eq(2)
  end

  describe 'task string parsing' do

    it 'handles an empty string' do
      creator = CreatesProject.new(name: 'Test', task_string: '')
      tasks = creator.convert_string_to_tasks
      expect(tasks.size).to eq(0)
    end

    context 'with a single task string' do
      it 'creates a task' do
        creator = CreatesProject.new(name: 'Test', task_string: 'Start things')
        tasks = creator.convert_string_to_tasks
        expect(tasks.size).to eq(1)
      end

      it 'assigns task title' do
        creator = CreatesProject.new(name: 'Test', task_string: 'Start things')
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:title)).to eq(['Start things'])
      end

      it 'defaults a task size to 1' do
        creator = CreatesProject.new(name: 'Test', task_string: 'Start things')
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:size)).to eq([1])
      end

      it 'parses out the provided size' do
        creator = CreatesProject.new(name: 'Test', task_string: 'Start things:3')
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:size)).to eq([3])
      end
    end

    context 'with a multiple tasks in string' do
      it 'creates expected number of tasks' do
        creator = CreatesProject.new(name: 'Test', task_string: 'Start things\nEnd things')
        tasks = creator.convert_string_to_tasks
        expect(tasks.size).to eq(2)
      end

      it 'assigns task title for each task' do
        creator = CreatesProject.new(name: 'Test', task_string: 'Start things\nEnd things')
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:title)).to eq(['Start things', 'End things'])
      end

      it 'parses out the provided sizes' do
        creator = CreatesProject.new(name: 'Test', task_string: 'Start things:3\nEnd things:7')
        tasks = creator.convert_string_to_tasks
        expect(tasks.map(&:size)).to eq([3,7])
      end
    end


  end
end