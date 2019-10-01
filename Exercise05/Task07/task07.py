import json;
a = [1]
a.append(a)

print(a)

# -> [1, 2, [...]]

json.dumps(a)

"""
Traceback (most recent call last):
  File "C:/Users/Kai Bergmann/.PyCharmCE2018.2/config/scratches/task07.py", line 9, in <module>
    json.dumps(a)
  File "C:\ProgramData\Anaconda3\lib\json\__init__.py", line 231, in dumps
    return _default_encoder.encode(obj)
  File "C:\ProgramData\Anaconda3\lib\json\encoder.py", line 199, in encode
    chunks = self.iterencode(o, _one_shot=True)
  File "C:\ProgramData\Anaconda3\lib\json\encoder.py", line 257, in iterencode
    return _iterencode(o, 0)
ValueError: Circular reference detected
"""