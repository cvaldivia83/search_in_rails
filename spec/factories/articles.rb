FactoryBot.define do
  factory :article do
    title { "How to create a new article from scratch" }
    subtitle { "How to conquer your fear and start writing" }
    author { "Carla Valdivia" }
    category { "DIY" }

    trait :long_title do 
      title { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut cum culpa perferendis qui exercitationem" }
    end

    trait :long_subtitle do 
      subtitle { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut cum culpa perferendis qui exercitationem" }
    end
    
    trait :long_body do 
      # 1843 characters
      body { "In your first writing session. You're not going to write. I never start writing by writing. You need to lay the foundations first.
      Pick an idea to write about. Keep it simple and focused on one thing. You're not writing a book. Or even the chapter of a book. A blog post is like 1 section…
      Write out a simple headline. This will help guide your writing. Don't try to create something clever. A simple clear headline will do.
      Understandably, not everyone likes to scribble down ideas as they come. But if you plan to elevate your writing skills, you need to make a list of ideas continuously.
      This helps give direction when writing. As a writer, waves of ideas flood the mind when they are least expected. To help keep these ideas at bay, you can keep a notepad handy.
      You should see this as a draft for your intending articles. These ideas will express as an outline of your content. And looking at the ideas you noted down gives you a clearer vision of the article you need to create.
      By conducting comprehensive research, you can filter through the bulk of irrelevant information and settle on what is required— more like seeking a needle in a haystack.
      Often as writers, we are told to learn the art of storytelling. As beneficial as that may be, it shouldn't be a substitute for delivering quality content. Because remember, you're writing an article, not a novel.
      You have to assume your readers have a basic understanding of the language. Use simple words to aid their general understanding.
      Since you're only writing an article, it's vital that you hook your readers in their short attention span. Therefore, be direct and concise in your writings by getting right to the point.
      Don't linger on the introduction, and explain things concisely rather than telling an entire story.
      Write out a simple headline. This will help guide your writing. Don't try to create something clever. A simple clear headline will do.
      Understandably, not everyone likes to scribble down ideas as they come. But if you plan to elevate your writing skills, you need to make a list of ideas continuously. This helps give direction when writing. As a writer, waves of ideas flood the mind when they are least expected." }
    end

    trait :short_body do
      # 721 characters
      body { "In your first writing session. You're not going to write. I never start writing by writing. You need to lay the foundations first.
      Pick an idea to write about. Keep it simple and focused on one thing. You're not writing a book. Or even the chapter of a book. A blog post is like 1 section…
      Write out a simple headline. This will help guide your writing. Don't try to create something clever. A simple clear headline will do.
      Understandably, not everyone likes to scribble down ideas as they come. But if you plan to elevate your writing skills, you need to make a list of ideas continuously. This helps give direction when writing. As a writer, waves of ideas flood the mind when they are least expected. " }
    end

    trait :correct_body do
      # 1020 characters 
      body { "In your first writing session. You're not going to write. I never start writing by writing. You need to lay the foundations first.
      Pick an idea to write about. Keep it simple and focused on one thing. You're not writing a book. Or even the chapter of a book. A blog post is like 1 section…
      Write out a simple headline. This will help guide your writing. Don't try to create something clever. A simple clear headline will do.
      Understandably, not everyone likes to scribble down ideas as they come. But if you plan to elevate your writing skills, you need to make a list of ideas continuously.
      This helps give direction when writing. As a writer, waves of ideas flood the mind when they are least expected. To help keep these ideas at bay, you can keep a notepad handy.
      You should see this as a draft for your intending articles. These ideas will express as an outline of your content. And looking at the ideas you noted down gives you a clearer vision of the article you need to create." }
    end
  end
end
