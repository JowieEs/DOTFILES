;; extends

;; Bump the priority of built-in types so they beat standard javascript variables
((predefined_type) @type.builtin.typescript (#set! priority 110))
