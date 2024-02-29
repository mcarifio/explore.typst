// pandoc -t html example-merged-dicts.typ
#let defaults = (x:1, y:2)
#let overrides = (x:3, z:4)
#let merged = overrides + defaults // first key wins
#for (k,v) in merged { [ #k: #v ] }
