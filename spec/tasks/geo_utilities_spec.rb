require 'rails_helper'
require 'rake'
load File.expand_path("../../../lib/tasks/geo_utilities.rake", __FILE__)

RSpec.describe 'geo_utilities:find_highest_cities' do
  let(:highest_city_output) {"4824m - Santa Barbara, Bolivia"}
  let(:expected_city_count) {155}

  before do
    Rake::Task.define_task(:environment)
  end

  describe 'output to stdout' do
    let!(:original_stdout) { $stdout }

    after do
      $stdout = original_stdout
    end
    
    it "should output the highest cities" do
      string_io = StringIO.new
      $stdout = string_io

      invoke_rake_task  

      lines = $stdout.string.split("\n")
      expect(lines[0]).to eq(highest_city_output)
      expect(lines.length).to eq(expected_city_count)
    end
  end

  describe 'output to text file' do
    let(:file_name) { 'output.txt' }
    
    after do
      File.delete(file_name) if File.exists?(file_name)
    end

    it "should output the highest cities" do
      invoke_rake_task  

      expect(File.exists?(file_name)).to be(true)
      lines = File.readlines(file_name)
      expect(lines[0].strip).to eq(highest_city_output)
      expect(lines.length).to eq(expected_city_count)
    end
  end

  def invoke_rake_task
    Rake::Task['geo_utilities:find_highest_cities'].invoke('World_Cities_Location_table.csv')
  end
end