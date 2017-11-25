describe 'API' do
  def app
    TalonWorkerAPI
  end

  it "says bye" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('bye')
  end
end
