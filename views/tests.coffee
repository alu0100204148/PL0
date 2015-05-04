assert = chai.assert
suite 'PEGJS ADPR', ->
  test 'Comprobación de prioridad de los operadores', ->
    aux = pl0.parse('x = 1 + 40 * 3 .')
    assert.equal aux.program[0].sentence.right.type, '+'
    assert.equal aux.program[0].sentence.right.right.type, '*'
    return
  test 'Comprobación de recursividad a izquierdas (resta)', ->
    aux = pl0.parse('x = 5 - 2 - 3 .')
    assert.equal aux.program[0].sentence.type, 'ASSIGN'
    assert.equal aux.program[0].sentence.right.type, '-'
    assert.equal aux.program[0].sentence.right.left.type, '-'
    return
  test 'Comprobación de detección de errores', ->
    assert.throws (->
      pl0.parse 'x = (2'
      return
    ), 'Expected ")", [ \\t\\n\\r], [*\\/], [+\\-] or [0-9] but end of input found.'
    return
  test 'Comprobación de IF', ->
    aux = pl0.parse('if x == 2 then y = 32.')
    assert.equal aux.program[0].sentence.type, 'IF'
    return
  test 'Comprobación de IF ELSE', ->
    aux = pl0.parse('if x == 2 then y = 32 else y = 34.')
    assert.equal aux.program[0].sentence.type, 'IFELSE'
    return
  test 'Comprobación de BEGIN', ->
    aux = pl0.parse('begin x = 150; y  = 200; end .')
    assert.equal aux.program[0].sentence.type, 'BEGIN'
    return
  test 'Comprobación de WHILE', ->
    aux = pl0.parse('while x == 3 do y = x - 1.')
    assert.equal aux.program[0].sentence.type, 'WHILE'
    return
  test 'Comprobación de CALL', ->
    aux = pl0.parse('call prueba.')
    assert.equal aux.program[0].sentence.type, 'CALL'
    return
  test 'Comprobación de CALL con args', ->
    aux = pl0.parse('call prueba(a, b, c).')
    assert.equal aux.program[0].sentence.type, 'CALL'
    assert.equal aux.program[0].sentence.arguments[0].ident.value, 'a'
    assert.equal aux.program[0].sentence.arguments[1].ident.value, 'b'
    assert.equal aux.program[0].sentence.arguments[2].ident.value, 'c'
    return
  test 'Comprobación de PROCEDURE con args', ->
    aux = pl0.parse('procedure prueba(a, b); begin a = 1; b = 2; end; x = 7 - 1; .')
    assert.equal aux.program[0].procedure[0].arguments[0].ident.value, 'a'
    assert.equal aux.program[0].procedure[0].arguments[1].ident.value, 'b'
    return
  return
