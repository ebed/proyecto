module ArticlesHelper

  def articles_for_select
    Article.all.collect { |m| [m.nombre, m.id]}
  end
end
