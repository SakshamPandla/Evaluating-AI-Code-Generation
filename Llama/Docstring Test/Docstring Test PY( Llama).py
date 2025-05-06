def resolve_dependencies(dependency_graph):
    """
    Resolves dependencies in a directed acyclic graph (DAG) and returns a list of nodes in a valid order.
    
    The function uses a depth-first search (DFS) approach to traverse the graph and detects cyclic dependencies.
    
    Args:
        dependency_graph (dict): A dictionary representing the dependency graph, where each key is a node and its corresponding value is a list of dependencies.
    
    Returns:
        list: A list of nodes in a valid order, such that for every edge (u,v), node u comes before node v in the list.
    
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