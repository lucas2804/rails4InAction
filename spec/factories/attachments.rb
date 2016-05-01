FactoryGirl.define do
  factory :attachment do
    # transient do
    #   file_to_attach "spec/fixtures/speed.txt"
    # end

    file { File.open "spec/fixtures/speed.txt" }
  end
end