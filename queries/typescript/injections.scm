
((template_string) @html
 (#match? @html ".*<.*>.*"))
((call_expression
  function: (identifier) @func_name
  arguments: (template_string) @html)
 (#eq? @func_name "html"))