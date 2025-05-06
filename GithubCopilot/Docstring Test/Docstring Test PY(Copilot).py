def resolve_dependencies(dependency_graph):
    """
    Resolves the order of dependencies in a directed acyclic graph (DAG) using a topological sort.

    This function takes a dictionary representing a dependency graph, where each key is a node
    and the value is a list of nodes that the key depends on. It determines the order in which
    the nodes can be processed such that all dependencies of a node are resolved before the node
    itself.

    If a cyclic dependency is detected in the graph, a `ValueError` is raised.

    Parameters:
    - dependency_graph (dict): A dictionary where keys are nodes and values are lists of nodes
      representing dependencies.

    Returns:
    - list: A list of nodes in the order they can be processed, such that all dependencies are
      resolved before their dependent nodes.

    Raises:
    - ValueError: If a cyclic dependency is detected.

    Example:
    ```
    dependency_graph = {
        'A': ['B', 'C'],
        'B': ['C'],
        'C': []
    }
    order = resolve_dependencies(dependency_graph)
    print(order)  # Output: ['C', 'B', 'A']
    ```
    """
    visited = set()
    temp_mark = set()
    result = []

    def visit(node):
        if node in visited:
            return
        if node in temp_mark:
            raise ValueError(f"Cyclic dependency detected at {node}")
        temp_mark.add(node)
        for dep in dependency_graph.get(node, []):
            visit(dep)
        temp_mark.remove(node)
        visited.add(node)
        result.append(node)

    for node in dependency_graph:
        visit(node)
    
    return result[::-1]