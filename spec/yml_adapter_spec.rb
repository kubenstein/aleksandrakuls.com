require './lib/adapters'
require './lib/adapters/yml_adapter'

describe 'YmlAdapter' do
  let(:adapter) { YmlAdapter.new(ymls_dir_path: 'spec/fixtures/') }
  let(:data) { adapter.load_data(:articles, conditions: { language: :en }) }

  it 'loads data properly' do
    expect(data.count).to eq 2
    expect(data[0]).to eq(text: 'Article Text',
                          title: 'Article Title',
                          language: :en)
  end
end
