import os
from pythonlua.translator import Translator
translator = Translator()


for root, dirs, files in os.walk(r'Source'):
    for file in files:
        if file.endswith('.py'):
            path = os.path.join(root, file)
            py = ''
            with open(path) as f:
                py = f.read()
                path, extension = os.path.splitext(path)
                print(path, extension, path.split("\\")[-1])
                with open(f"{path}.lua", "w") as pf:
                    try:
                        l = path.split("\\")
                        v = "_".join(l[1:])
                        pf.write(v + " = {}\n")
                        pf.write(f"local {l[-1]} = " + f"{v}\n")
                        pf.write(translator.translate(py))
                    except Exception as e:
                        print(e)
                        print(path+extension)

