from dosql import *
import cgi
import json

def index(req, menu_id):
    menu_id = cgi.escape(menu_id)
    x = doSql()
    rets = x.execqry("select * from get_order('" + menu_id + "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
