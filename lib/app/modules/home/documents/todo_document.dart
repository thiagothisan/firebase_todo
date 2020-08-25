const String todosQuery = '''
subscription MyQuery {
  todos(order_by: {id: asc}) {
    check
    id
    title
  }
}
''';

const String todoInsertQuery = '''
mutation insertTodo(\$title: String) {
  insert_todos(objects: {title: \$title}) {
    returning {
      id
    }
  }
}
''';

const String todoUpdateQuery = '''
mutation updateTodo(\$id: Int, \$title: String, \$check: Boolean) {
  update_todos(where: {id: {_eq: \$id}}, _set: {check: \$check, title: \$title}) {
    affected_rows
  }
}
''';

const String todoDeleteQuery = '''
mutation deleteTodo(\$id: Int) {
  delete_todos(where: {id: {_eq: \$id}}) {
    affected_rows
  }
}
''';
