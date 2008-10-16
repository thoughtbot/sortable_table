# This simulates loading the sortable_table gem, but without relying on
# vendor/gems

sortable_table_path = File.join(File.dirname(__FILE__), *%w(.. .. .. ..))
sortable_table_lib_path = File.join(sortable_table_path, "lib")

$LOAD_PATH.unshift(sortable_table_lib_path)
load File.join(sortable_table_path, 'rails', 'init.rb')
