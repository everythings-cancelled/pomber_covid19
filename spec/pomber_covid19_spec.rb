RSpec.describe PomberCovid19 do
  describe "#find_by_region_name" do
  context "when the POST request is successful" do
    let(:stubbed_region_covid19_data) { [ { "date"=>"2020-1-22", "confirmed"=>0, "deaths"=>0, "recovered"=>0 } ] }
    let(:stubbed_response) { OpenStruct.new(code: 200, "Canada" => stubbed_region_covid19_data) }

    before do
      allow(HTTParty).to receive(:get).with(described_class::BASE_URL).and_return(stubbed_response)
    end

    context "and the region is found" do
      it "returns the covid19 data" do
        expect(described_class.find_by_region_name("Canada")).to eq(stubbed_region_covid19_data)
      end
    end

    context "and the region is not found" do
      it "raises a RegionNotFoundError" do
        expect {described_class.find_by_region_name("Hogwarts") }.to raise_error(PomberCovid19::RegionNotFoundError)
      end
    end
  end

  context "when the post request fails" do
      let(:stubbed_response) { OpenStruct.new(code: 500) }

      before do
        allow(HTTParty).to receive(:get).with(described_class::BASE_URL).and_return(stubbed_response)
      end

      it "raises an HttpRequestError" do
        expect { described_class.find_by_region_name("Foo") }.to raise_error(PomberCovid19::HttpRequestError)
      end
    end
  end
end
