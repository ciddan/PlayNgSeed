package views.html.helper

object include {
  import play.api.templates.Html
  import play.api.Play
  import play.api.Play.current

  def apply(filePath: String, rootDir: String = "public"): Html = {
    val includeTarget = Play.getExistingFile(rootDir + "/" + filePath)
    includeTarget map { file =>
      val content = scala.io.Source.fromFile(file).mkString
      Html(content)
    } getOrElse Html("<h2 style=\"color:red\">Include error: Could not find requested file: " + filePath + "</h2>")
  }
}