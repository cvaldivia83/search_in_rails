require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ArticlesHelper. For example:
#
# describe ArticlesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ArticlesHelper, type: :helper do
  describe "#render_category" do 
    it "returns indigo color utility for tech article category" do  
      results = render_category("tech")
      expect(results).to match("bg-indigo-200 text-indigo-800")
    end

    it "returns red color utility for career article category" do 
      results = render_category('career')
      expect(results).to match("bg-red-200 text-red-800")
    end

    it "returns purple color utility for challenge article category" do 
      results = render_category('challenge')
      expect(results).to match('bg-purple-200 text-purple-800')
    end

    it "returns pink color utility for tutorial article category" do 
      results = render_category('tutorial')
      expect(results).to match('bg-pink-200 text-pink-800')
    end

    it "returns teal color utility for hackathon article category" do 
      results = render_category('hackathon')
      expect(results).to match('bg-teal-200 text-teal-800')
    end

    it "if a new category opens up it should return a slate color utility" do 
      results = render_category('code')
      expect(results).to match('bg-slate-200 text-slate-800')
    end
  end
end
