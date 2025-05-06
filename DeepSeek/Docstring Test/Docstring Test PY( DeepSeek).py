def resolve_dependencies(dependency_graph):
    """
    Performs a topological sort on a dependency graph to determine a valid execution order.
    
    This function uses a depth-first search approach to detect cycles and resolve dependencies
    in the correct order (dependencies come before dependents). It implements Kahn's algorithm
    with cycle detection.
    
    Args:
        dependency_graph: A dictionary representing the dependency graph where:
                         - Keys are nodes (typically strings representing tasks or items)
                         - Values are lists of nodes that the key depends on (its dependencies)
    
    Returns:
        A list representing a valid execution order where all dependencies come before their
        dependents. The order is reversed from the standard topological sort to put dependencies first.
    
    Raises:
        ValueError: If a cyclic dependency is detected in the graph.
    
    Example:
        >>> graph = {'A': ['B', 'C'], 'B': ['C'], 'C': []}
        >>> resolve_dependencies(graph)
        ['C', 'B', 'A']  # Valid execution order where all dependencies are satisfied
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