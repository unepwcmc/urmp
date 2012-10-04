shared_examples_for :succesful_page do
  it 'responds with 200' do
    visit path
    page.status_code.should == 200
  end
end
