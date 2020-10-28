global.test_data_names = [
    'in-yaml',
    'out-yaml',
    'emit-yaml',
    'in-json',
    'test-event',
    'lex-token',
    'error',
  ]

global.test_tags = [
    '1.3-err',
    '1.3-mod',
    'alias',
    'anchor',
    'comment',
    'complex-key',
    'directive',
    'document',
    'double',
    'duplicate-key',
    'edge',
    'empty-key',
    'empty',
    'error',
    'explicit-key',
    'flow',
    'folded',
    'footer',
    'header',
    'indent',
    'jayt',
    'libyaml-err',
    'literal',
    'local-tag',
    'mapping',
    'scalar',
    'sequence',
    'simple',
    'single',
    'spec',
    'tag',
    'unknown-tag',
    'upto-1.2',
    'whitespace',
  ]

global.suite_to_data = (files, callback)->
  for input_file in files
    o = {}
    o.id = input_file.replace /^test\/(.*)\.tml$/, '$1'

    testml = read input_file
    ast = (new TestMLCompiler.Compiler).compile(testml)
    data = JSON.parse(ast).data[0]

    {label, point} = data
    o.label = label
    o.name = _.lowerCase(label)
      .replace /[^-\w]+/g, '-'
      .replace /^-?(.*?)-?$/, '$1'

    for name in test_data_names
      o[name] = point[name]

    t = {}
    for tag in point.tags.split /\ +/
      t[tag] = '√'

    for tag in test_tags
      o[tag] = (t[tag] or '')

    callback o

# vim: sw=2:
