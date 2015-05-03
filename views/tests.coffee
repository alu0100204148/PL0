assert = chai.assert
suite 'Comma Separated Values', ->
  setup ->
    if typeof __html__ != 'undefined'
      document.body.innerHTML = __html__['https://analizadordpr.herokuapp.com/test']
      original = document.getElementById('original')
      converted = document.getElementById('converted')
    return
  test 'a = 3', ->
    original.value = 'a = 3'
    $('button').trigger 'click'
    assert.deepEqual OUTPUT.innerHTML, '{\n  "type": "=",\n  "left": {\n    "type": "ID",\n    "value": "a"\n  },\n  "right": {\n    "type": "NUM",\n    "value": 3\n  }\n}'
    return
  test 'a = ( a + 3 )', ->
    original.value = 'a = ( a + 3 )'
    $('button').trigger 'click'
    assert.deepEqual OUTPUT.innerHTML, '{\n  "type": "=",\n  "left": {\n    "type": "ID",\n    "value": "a"\n  },\n  "right": {\n    "type": "+",\n    "left": {\n      "type": "ID",\n      "value": "a"\n    },\n    "right": {\n      "type": "NUM",\n      "value": 3\n    }\n  }\n}'
    return
  test 'Prueba varias lineas', ->
    original.value = 'a = 4*2;\nb = 2*(a+1);\np b'
    $('button').trigger 'click'
    assert.deepEqual OUTPUT.innerHTML, '[\n  {\n    "type": "=",\n    "left": {\n      "type": "ID",\n      "value": "a"\n    },\n    "right": {\n      "type": "*",\n      "left": {\n        "type": "NUM",\n        "value": 4\n      },\n      "right": {\n        "type": "NUM",\n        "value": 2\n      }\n    }\n  },\n  {\n    "type": "=",\n    "left": {\n      "type": "ID",\n      "value": "b"\n    },\n    "right": {\n      "type": "*",\n      "left": {\n        "type": "NUM",\n        "value": 2\n      },\n      "right": {\n        "type": "+",\n        "left": {\n          "type": "ID",\n          "value": "a"\n        },\n        "right": {\n          "type": "NUM",\n          "value": 1\n        }\n      }\n    }\n  },\n  {\n    "type": "P",\n    "value": {\n      "type": "ID",\n      "value": "b"\n    }\n  }\n]'
    return
  test 'Prueba Error', ->
    original.value = 'a = 3 + (4;\nb = 5'
    $('button').trigger 'click'
    assert.deepEqual OUTPUT.innerHTML, '<div class="error"><pre>SyntaxError: Expected ")", [ \\t\\n\\r], [*\\/], [+\\-] or [0-9] but ";" found.\n</pre></div>'
    return
  return
