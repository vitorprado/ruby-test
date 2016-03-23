require 'rails_helper'

describe 'ModelsUpdater' do
  
  describe 'update' do

    let(:brand_id) { 7 }
    let(:webmotors_response) { WebmotorsFetcherService.fetch("modelos", { marca: brand_id }) }

    before(:each) do
      stub_request(:post, ENV['ENDPOINT'] + "modelos")
        .to_return(:body => File.read(File.join("spec", "fixtures", "models.json")))
      webmotors_response.reject!{ |item| item["Nome"].blank? }
      Model.destroy_all
    end
    context 'when database is empty' do
      it 'should save all models' do
        ModelsUpdater.update(brand_id)
        expect(Model.count).to eq webmotors_response.size
      end
    end

    context 'when has saved brands' do
      it 'should save only the diference' do
        ModelsUpdater.update(brand_id)
        model = Model.last
        model.destroy
        ModelsUpdater.update(brand_id);

        expect(Model.find_by_name(model.name)).to be_instance_of Model 
        expect(Model.count).to eq webmotors_response.size
      end
    end
  end
end
