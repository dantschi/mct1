-- Handout-PDF (LaTeX): je Folie (##) als Kasten oben, Notizen darunter.
-- Behebt u. a. die Reihenfolge und kapselt Inhalt für lesbare Typografie.

local function is_notes_div(el)
  return el.t == "Div" and el.classes:includes("notes")
end

function Pandoc(doc)
  -- Nur für LaTeX/PDF umstrukturieren
  if not FORMAT:match("latex") then
    return nil
  end

  local blocks = doc.blocks
  local new_blocks = pandoc.List()
  local i = 1

  while i <= #blocks do
    local b = blocks[i]

    if b.t == "Header" and b.level == 2 then
      local slide_blocks = pandoc.List({ b })
      local note_blocks = pandoc.List()
      i = i + 1

      while i <= #blocks do
        local cur = blocks[i]
        if cur.t == "Header" and cur.level <= 2 then
          break
        end
        if is_notes_div(cur) then
          for _, nb in ipairs(cur.content) do
            note_blocks:insert(nb)
          end
        else
          slide_blocks:insert(cur)
        end
        i = i + 1
      end

      -- Folienkarte
      new_blocks:insert(pandoc.RawBlock("latex", "\\Needspace{12\\baselineskip}"))
      new_blocks:insert(pandoc.RawBlock("latex", "\\begin{folienblock}"))
      for _, sb in ipairs(slide_blocks) do
        new_blocks:insert(sb)
      end
      new_blocks:insert(pandoc.RawBlock("latex", "\\end{folienblock}"))

      -- Skript darunter
      if #note_blocks > 0 then
        new_blocks:insert(pandoc.RawBlock("latex", "\\begin{notesblock}"))
        new_blocks:insert(pandoc.RawBlock(
          "latex",
          "{\\bfseries\\color{dhbwred}Skript / Dozententext}\\par\\medskip"
        ))
        for _, nb in ipairs(note_blocks) do
          new_blocks:insert(nb)
        end
        new_blocks:insert(pandoc.RawBlock("latex", "\\end{notesblock}"))
      end
    else
      new_blocks:insert(b)
      i = i + 1
    end
  end

  doc.blocks = new_blocks
  return doc
end
