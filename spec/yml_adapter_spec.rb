require './lib/adapters'
require './lib/adapters/yml_adapter'

describe 'YmlAdapter' do
  let(:adapter) { YmlAdapter.new(ymls_dir_path: 'spec/fixtures/') }
  let(:articles_from_fixture) do
    adapter.load_data(:articles, conditions: { language: :en })
  end

  it 'loads data properly' do
    expect(articles_from_fixture.count).to eq 2
    expect(articles_from_fixture[0]).to eq(text: 'Article Text',
                                           title: 'Article Title',
                                           language: :en)
  end
end
