
; Identifiers

(field_identifier) @variable.other.member

(identifier) @variable

(package_identifier) @namespace

(const_spec
  name: (identifier) @constant)

(type_spec 
  name: (type_identifier) @constructor)

(keyed_element . (literal_element (identifier) @variable.other.member))
(field_declaration
  name: (field_identifier) @variable.other.member)

(parameter_declaration (identifier) @variable.parameter)
(variadic_parameter_declaration (identifier) @variable.parameter)

(label_name) @label

(const_spec
  name: (identifier) @constant)

; Function calls

(call_expression
  function: (identifier) @function)

(call_expression
  function: (selector_expression
    field: (field_identifier) @function.method))

(call_expression
  function: (identifier) @function.builtin
  (#match? @function.builtin "^(append|cap|close|complex|copy|delete|imag|len|make|new|panic|print|println|real|recover)$"))

; Types

(type_identifier) @type

(type_parameter_list
  (parameter_declaration
    name: (identifier) @type.parameter))

((type_identifier) @type.builtin
  (#match? @type.builtin "^(any|bool|byte|comparable|complex128|complex64|error|float32|float64|int|int16|int32|int64|int8|rune|string|uint|uint16|uint32|uint64|uint8|uintptr)$"))

; Function definitions

(function_declaration
  name: (identifier) @function)

(method_declaration
  name: (field_identifier) @function.method)

(method_spec 
  name: (field_identifier) @function.method) 


; Operators

[
  "--"
  "-"
  "-="
  ":="
  "!"
  "!="
  "..."
  "*"
  "*"
  "*="
  "/"
  "/="
  "&"
  "&&"
  "&="
  "%"
  "%="
  "^"
  "^="
  "+"
  "++"
  "+="
  "<-"
  "<"
  "<<"
  "<<="
  "<="
  "="
  "=="
  ">"
  ">="
  ">>"
  ">>="
  "|"
  "|="
  "||"
  "~"
] @operator

; Keywords

[
  "default"
  "type"
] @keyword

[
  "defer"
  "go"
  "goto"
] @keyword.control

[
  "if"  
  "else"
  "switch"
  "select"
  "case"
] @keyword.control.conditional

[
  "for"
  "range"
] @keyword.control.repeat

[
  "import"
  "package"
] @keyword.control.import

[
  "return"
  "continue"
  "break"
  "fallthrough"
] @keyword.control.return

[
  "func"
] @keyword.function

[
  "var"
  "chan"
  "interface"
  "map"
  "struct"
] @keyword.storage.type

[
  "const"
] @keyword.storage.modifier

; Delimiters

[
  ":"
  "."
  ","
  ";"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

; Literals

[
  (interpreted_string_literal)
  (raw_string_literal)
] @string

(rune_literal) @constant.character

(escape_sequence) @constant.character.escape

[
  (int_literal)
] @constant.numeric.integer

[
  (float_literal)
  (imaginary_literal)
] @constant.numeric.float

[
  (true)
  (false)
] @constant.builtin.boolean

[
  (nil)
  (iota)
] @constant.builtin

; Comments

(comment) @comment

; Doc Comments
(source_file
  .
  (comment)+ @comment.block.documentation)

(source_file
  (comment)+ @comment.block.documentation
  .
  (const_declaration))

(source_file
  (comment)+ @comment.block.documentation
  .
  (function_declaration))

(source_file
  (comment)+ @comment.block.documentation
  .
  (type_declaration))

(source_file
  (comment)+ @comment.block.documentation
  .
  (var_declaration))
