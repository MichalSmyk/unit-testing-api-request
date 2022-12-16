require_relative '../lib/cat_facts'
require 'net/http'

RSpec.describe CatFacts do 
    it "gets fact about a cat" do 
        fake_requester = double :requester
        allow(fake_requester).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return(
           ' {"fact":"Tigers are excellent swimmers and do not avoid water.","length":53}'
        )
        cat_facts = CatFacts.new(fake_requester)
        expect(cat_facts.provide).to eq "Cat fact: Tigers are excellent swimmers and do not avoid water."
    end
