assert = chai.assert
suite 'Comma Separated Values', ->
  setup ->
    if typeof __html__ != 'undefined'
      document.body.innerHTML = __html__['https://analizadordpr.herokuapp.com/test']
      original = document.getElementById('original')
      converted = document.getElementById('converted')
    return
  test 'Prueba if', ->
    original.value = 'if a == 1 then b = 4'
    $('button').trigger 'click'
    assert.deepEqual OUTPUT.innerHTML, '{\n  "type": "IF",\n  "left": {\n    "type": "==",\n    "left": {\n      "type": "ID",\n      "value": "a"\n    },\n    "right": {\n      "type": "NUM",\n      "value": 1\n    }\n  },\n  "right": {\n    "type": "=",\n    "left": {\n      "type": "ID",\n      "value": "b"\n    },\n    "right": {\n      "type": "NUM",\n      "value": 4\n    }\n  }\n}'
    return
  test 'Pueba asignacion', ->
    original.value = 'a = 4*2;\nif a > 6 then p a'
    $('button').trigger 'click'
    assert.deepEqual OUTPUT.innerHTML, '[\n  {\n    "type": "=",\n    "left": {\n      "type": "ID",\n      "value": "a"\n    },\n    "right": {\n      "type": "*",\n      "left": {\n        "type": "NUM",\n        "value": 4\n      },\n      "right": {\n        "type": "NUM",\n        "value": 2\n      }\n    }\n  },\n  {\n    "type": "IF",\n    "left": {\n      "type": "&gt;",\n      "left": {\n        "type": "ID",\n        "value": "a"\n      },\n      "right": {\n        "type": "NUM",\n        "value": 6\n      }\n    },\n    "right": {\n      "type": "P",\n      "value": {\n        "type": "ID",\n        "value": "a"\n      }\n    }\n  }\n]'
    return
  test 'Prueba varias lineas', ->
    original.value = 'a = 4*2;\nb = 2*(a+1);\np b'
    $('button').trigger 'click'
    assert.deepEqual OUTPUT.innerHTML, '[\n  {\n    "type": "=",\n    "left": {\n      "type": "ID",\n      "value": "a"\n    },\n    "right": {\n      "type": "*",\n      "left": {\n        "type": "NUM",\n        "value": 4\n      },\n      "right": {\n        "type": "NUM",\n        "value": 2\n      }\n    }\n  },\n  {\n    "type": "=",\n    "left": {\n      "type": "ID",\n      "value": "b"\n    },\n    "right": {\n      "type": "*",\n      "left": {\n        "type": "NUM",\n        "value": 2\n      },\n      "right": {\n        "type": "+",\n        "left": {\n          "type": "ID",\n          "value": "a"\n        },\n        "right": {\n          "type": "NUM",\n          "value": 1\n        }\n      }\n    }\n  },\n  {\n    "type": "P",\n    "value": {\n      "type": "ID",\n      "value": "b"\n    }\n  }\n]'
    return
  test 'Prueba Error', ->
    original.value = 'a = 3 + (4;\nb = 5'
    $('button').trigger 'click'
    assert.deepEqual OUTPUT.innerHTML, '<div class="error">Syntax Error. Expected ) found \';\' near \';\nb = 5\'</div>'
    return
  return
