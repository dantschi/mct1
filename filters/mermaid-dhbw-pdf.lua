-- Constrain all images in LaTeX/PDF handouts to the text width.
-- Mermaid cells are already rendered to PNG before pandoc filters run,
-- so CodeBlock-based theming does not apply; Image attributes do.

function Image(el)
  if not FORMAT:match("latex") then
    return nil
  end
  el.attributes["width"] = "100%"
  el.attributes["height"] = nil
  return el
end
