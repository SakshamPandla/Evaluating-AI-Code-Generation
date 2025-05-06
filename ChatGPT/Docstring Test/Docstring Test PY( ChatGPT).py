def resolve_dependencies(dependency_graph):
    """
    Resolves and returns an order of nodes based on their dependencies using topological sorting.

    This function performs a depth-first search on the input dependency graph and returns
    a list of nodes sorted in an order such that each node appears after all of its dependencies.
    If a cyclic dependency is detected, a ValueError is raised.

    Parameters:
        dependency_graph (dict): A dictionary where keys are node names and values are lists of nodes
                                 that the key node depends on.

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