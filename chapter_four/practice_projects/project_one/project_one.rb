# NOTES: I am not 100% sure this is correct.
# Using binding.pry, I can confirm that this *does* always go down the "right" side before the left side,
# but in terms of the location of the puts statements,
# I am not absolutely certain it is correct.
# Still, the idea is good.

def reverse_inorder_traversal(node)
  if node['children'].empty?
    puts node[:data]
    return
  end

  if node['children'].count >= 1
    reverse_inorder_traversal(node['children'].last)
  end

  if node['children'].count >= 2
    reverse_inorder_traversal(node['children'].first)
  end
  puts node[:data]
  return
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

reverse_inorder_traversal(root)