def resolve_dependencies(dependency_graph):
    """
    Performs a topological sort on a directed acyclic graph (DAG) represented
    as a dictionary to resolve dependencies.

    The keys of the dictionary represent nodes (items with dependencies), and
    the values are lists of their direct dependencies. The function returns a
    list of nodes in an order that satisfies the dependencies, meaning that
    for any node in the output list, all of its dependencies appear before it.

    Args:
        dependency_graph (dict): A dictionary representing the dependency graph.
            Keys are nodes, and values are lists of their dependencies.

    Returns:
        list: A list of nodes in topologically sorted order.

    Raises:
        ValueError: If a cyclic dependency is detected in the graph.
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