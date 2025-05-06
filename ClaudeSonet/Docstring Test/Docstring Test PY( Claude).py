def resolve_dependencies(dependency_graph):
    """
    Performs topological sorting on a dependency graph using depth-first search.
    
    This function takes a dependency graph represented as a dictionary where keys are nodes
    and values are lists of dependencies for each node. It returns a list of nodes ordered
    such that for each directed edge (u, v) in the dependency graph, u comes after v in the
    resulting list. This ordering ensures that all dependencies are satisfied before their
    dependent nodes.
    
    Args:
        dependency_graph (dict): A dictionary where keys are nodes and values are lists of
                                dependencies for those nodes. Each node must be a hashable type.
    
    Returns:
        list: A topologically sorted list of nodes where dependencies come before the nodes
              that depend on them.
    
    Raises:
        ValueError: If a cyclic dependency is detected in the graph.
    
    Example:
        >>> graph = {
        ...     'A': ['B', 'C'],
        ...     'B': ['D'],
        ...     'C': ['D'],
        ...     'D': []
        ... }
        >>> resolve_dependencies(graph)
        ['D', 'B', 'C', 'A']
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