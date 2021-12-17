class Post
  attr_accessor :content, :comments
  def initialize(content)
    @content = content
    @comments = []
  end
end

module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end
    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'
      if verb != "GET" and verb != "POST" and verb != "PUT" and verb != "DELETE" and verb != "q"
        puts "Exception: wrong argument"
        next
      end
      action = nil
      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end
      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end
class PostsController
  extend Resource

  def initialize(posts)
    @posts = posts
  end

  def index_validate(index, array)
    #то что введен без стринговских "примесей"
    if index != index.to_i.to_s
      puts "Exception: #{index} is not ineger"
      return -1
    end
    if index.to_i < 0 or index.to_i > array.size - 1
      puts "Exception: index out of bounds"
      return -1
    end
    return 0

  end
  def index
    for i in 0..(@posts.size-1)
      puts i.to_s + " " + @posts[i].content
    end
  end
  def show
    print 'Choose index of post: '
    index = gets.chomp

    if self.index_validate(index, @posts) == -1 then return end

    puts @posts[index.to_i].content

  end

  def create
    puts "Enter your post's content:"
    content = gets.chomp
    @posts.push(Post.new(content))
  end

  def update
    print 'Choose index of post: '
    index = gets.chomp

    if self.index_validate(index, @posts) == -1 then return end

    puts "Rewrite your post's content:"
    content = gets.chomp
    @posts[index.to_i].content = content

  end
  def destroy
    print 'Choose index of post: '
    index = gets.chomp

    if self.index_validate(index, @posts) == -1 then return end

    @posts.delete_at(index.to_i)

  end
end

class CommentsController
  extend Resource


  def initialize(posts)
    @posts = posts
  end

  def index_validate(index, array)

    if index != index.to_i.to_s
      puts "Exception: #{index} is not integer"
      return -1
    end

    if index.to_i < 0 or index.to_i > array.size - 1
      puts "Exception: index out of bounds"
      return -1
    end

    return 0

  end


  def index
    for i in 0..(@posts.size-1)
      puts "post index: #{i}"
      puts "post contnt:\n" + @posts[i].content
      puts "comments: "
      for j in 0..(@posts[i].comments.size - 1)
        puts j.to_s + " " + @posts[i].comments[j]
      end
    end
  end

  def show
    print 'Choose index of post: '
    post_index = gets.chomp

    if self.index_validate(post_index, @posts) == -1 then return end

    print 'Choose index of comment: '
    comment_index = gets.chomp

    if self.index_validate(comment_index, @posts[post_index.to_i].comments) == -1 then return end

    puts @posts[post_index.to_i].comments[comment_index.to_i]

  end

  def create
    print "Choose index of the post for which you are writing a comment: "
    index = gets.chomp

    if self.index_validate(index, @posts) == -1 then return end

    puts "Enter your comment:"

    comment = gets.chomp

    @posts[index.to_i].comments.push(comment)
  end
  def update
    print 'Choose index of post: '
    post_index = gets.chomp

    if self.index_validate(post_index, @posts) == -1 then return end

    print 'Choose index of comment: '
    comment_index = gets.chomp

    if self.index_validate(comment_index, @posts[post_index.to_i].comments) == -1 then return end

    puts "Rewrite comment:"
    comment = gets.chomp
    @posts[post_index.to_i].comments[comment_index.to_i] = comment

  end

  def destroy
    print 'Choose index of post: '
    post_index = gets.chomp

    if self.index_validate(post_index, @posts) == -1 then return end

    print 'Choose index of comment: '
    comment_index = gets.chomp

    if self.index_validate(comment_index, @posts[post_index.to_i].comments) == -1 then return end

    @posts[post_index.to_i].comments.delete_at(comment_index.to_i)

  end
end

class Router
  def initialize
    @routes = {}
  end

  def init

    posts = []

    resources(PostsController, 'posts', posts)
    resources(CommentsController,'comments', posts)
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp
      PostsController.connection(@routes['posts']) if choise == '1'
      CommentsController.connection(@routes['comments']) if choise == '2'
      break if choise == 'q'
    end
    puts 'Good bye!'
  end

  def resources(klass, keyword, posts_arr)
    controller = klass.new(posts_arr)
    @routes[keyword] = {
        'GET' => {
            'index' => controller.method(:index),
            'show' => controller.method(:show)
        },
        'POST' => controller.method(:create),
        'PUT' => controller.method(:update),
        'DELETE' => controller.method(:destroy)
    }

  end
end
router = Router.new
router.init
