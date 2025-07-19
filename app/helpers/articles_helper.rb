module ArticlesHelper
  def render_category(category)
    case category
    when "tech"
      return "bg-indigo-200 text-indigo-800"
    when "career"
      return "bg-red-200 text-red-800"
    when "challenge"
      return "bg-purple-200 text-purple-800"
    when "tutorial"
      return "bg-pink-200 text-pink-800"
    when "hackathon"
      return "bg-teal-200 text-teal-800"
    else 
      return "bg-slate-200 text-slate-800"  
    end
  end
end
