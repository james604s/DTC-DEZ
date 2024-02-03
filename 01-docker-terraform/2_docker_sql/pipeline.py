import sys

import pandas as pd

print(sys.argv)

#docker run -it test:pandas 2021-11-15
day = sys.argv[1]

# some fancy stuff with pandas

print(f'job finished successfully for day = {day}')