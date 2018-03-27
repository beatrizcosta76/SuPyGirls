from bottle import get, run, view, TEMPLATE_PATH, Bottle, static_file
import os.path
from . import code_controller
from . import static_controller
from . import py_dir, vitpy_dir

# Create a new list with absolute paths
TEMPLATE_PATH.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../view/tpl')))

application = Bottle()
_ = application

# Mount a new instance of bottle for each controller and URL prefix.
# appbottle.mount("/external/brython/Lib/site-packages", project_controller.bottle)
# application.mount("/<:re:.*>/_spy", code_controller.bottle)
application.mount("/<:re:.*>/stlib", static_controller.appbottle)
application.mount("/<:re:.*>/image", static_controller.appbottle)


@get('/')
@view("index")
def index():
    print(os.path.abspath(os.path.join(os.path.dirname(__file__), '../view/tpl')))
    return dict(mod='a0')


# Static Routes
@get("/_spy/_core/<filepath:re:.*\.py>")
def py(filepath):
    print("py(filepath):", filepath, py_dir)
    return static_file(filepath, root=py_dir)


# Static Routes
@get("/_vit/<modulepath:re:.*>/<filepath:re:.*\.py>")
def vitpy(modulepath, filepath):
    print("py(filepath):", modulepath, filepath, vitpy_dir)
    return static_file(filepath, root=vitpy_dir)
    # return static_file("{}/{}".format(modulepath, filepath), root=vitpy_dir)


if __name__ == "__main__":
    run(host='localhost', port=8080)
