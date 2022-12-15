def add_one_level_to_tree(node)
  if node['children'].empty?
    new_data = "NEW NODE!"
    new_node = {'data': new_data}
    node['children'].push(new_node)
    return
  else
    node['children'].each do |child|
      add_one_level_to_tree(child)
    end
  return
  end
end

require 'pry'

root = {'data': 'A'}
node2 = {'data': 'B'}
node3 = {'data': 'C'}
node4 = {'data': 'D'}
node5 = {'data': 'E'}
node6 = {'data': 'F'}
node7 = {'data': 'G'}
node8 = {'data': 'H'}
root['children'] = [node2, node3]
node2['children'] = [node4]
node3['children'] = [node5, node6]
node4['children'] = []
node5['children'] = [node7, node8]
node6['children'] = []
node7['children'] = []
node8['children'] = []

puts "Here is the original root:\n\n"
puts root
puts "\n\n"

add_one_level_to_tree(root)

puts "Here is the new root:\n\n"
puts root