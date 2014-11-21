class KeyGenerator
  generate: (queue, namespace) ->
    if namespace
      namespace..':queue:'..queue
    else
      'queue:'..queue

return KeyGenerator