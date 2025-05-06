# Add a docstring to the function that explains what it does.

def resolve_dependencies(dependency_graph):
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