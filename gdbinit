define ff
finish
end

python
import sys
sys.path.insert(0, '/home/ytshen/gdb/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

python
sys.path.insert(0, '/home/ytshen/gdb/script')
import backtrace
end
