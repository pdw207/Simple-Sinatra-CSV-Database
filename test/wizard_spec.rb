require 'pry'
require_relative '../lib/wizard.rb'

describe Wizard do

  let(:wizard1){Wizard.new("Me", "The Wizard from Within", "http://www.test.com")}
  let(:wizard2){Wizard.new("Darth", "Star Wars", "http://www.google.com")}

  it 'exists' do
    expect(wizard1.class).to eq(Wizard)
    expect(wizard2.class).to eq(Wizard)
  end

  it 'has url'do
    expect(wizard1.url).to eq("http://www.test.com")
    expect(wizard2.url).to eq("http://www.google.com")
  end

  it 'has description' do
    expect(wizard1.description).to eq("The Wizard from Within")
    expect(wizard2.description).to eq("Star Wars")
  end

  it 'has title' do
    expect(wizard1.title).to eq("Me")
    expect(wizard2.title).to eq("Darth")
  end

  it "raises an error if bad url is passed" do
    expect{ Wizard.new("asdf","dfsa","asdf")}.to raise_error
    expect{ Wizard.new("asdf","sdf","asdf")}.to raise_error
  end
end
