(directive) @function
(directive_start) @function
(directive_end) @function
(comment) @comment
((parameter) @include (#set! "priority" 110))
((php_only) @include (#set! "priority" 110))
((bracket_start) @function (#set! "priority" 120))
((bracket_end) @function (#set! "priority" 120))
(keyword) @function
; Example Query used in Nova to implement folding

(   (directive_start) @start
    (directive_end) @end.after
    (#set! role block))


(   (bracket_start) @start
    (bracket_end) @end
    (#set! role block))