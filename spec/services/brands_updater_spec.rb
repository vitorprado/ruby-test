require 'rails_helper'

describe 'BrandsUpdater' do
  
  describe 'update' do

    let(:webmotors_response) do
      WebmotorsFetcherService.fetch("marcas").reject{ |item| item["Nome"].blank? }
    end

    before(:each) do
      stub_request(:post, ENV['ENDPOINT'] + "marcas")
        .to_return(:body => File.read(File.join("spec", "fixtures", "brands.json")))
      Brand.destroy_all
    end

    context 'when database is empty' do
      it 'saves all brands' do
        BrandsUpdater.update()
        expect(Brand.all.count).to eq webmotors_response.size
      end
    end

    context 'when has saved brands' do
      it 'saves only the diference' do
        BrandsUpdater.update()
        brand = Brand.last
        brand.delete
        BrandsUpdater.update();

        expect(Brand.find_by_webmotors_id(brand.webmotors_id)).to be_instance_of Brand
        expect(Brand.all.count).to eq webmotors_response.size
      end
    end
  end
end
