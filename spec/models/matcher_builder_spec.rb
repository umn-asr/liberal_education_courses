require_relative "../../app/models/matcher_builder"

RSpec.describe MatcherBuilder do
  #describe "parse" do
    #it "creates an instance of query parser" do
      #returned = QueryParser.parse("test=hello")
      #expect(returned).to eq(test: "HELLO")
    #end
  #end

  #describe "new" do
    #describe "with a unparsed query" do
      #let(:unparsed_query) { "test=hello" }

      #it "sets its properties from the query components" do
        #it = QueryParser.new("test=hello")
        #expect(it.search_type).to eq(:test)
        #expect(it.search_param).to eq("HELLO")
      #end
    #end

    #describe "without a writing intensive query" do
      #it "converts the search_param to WI" do
        #it = QueryParser.new("writing_intensive=#{rand}")
        #expect(it.search_type).to eq(:writing_intensive)
        #expect(it.search_param).to eq("WI")
      #end
    #end
  #end
end
