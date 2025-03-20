import json

# TODO:
# - Log a warning whenever a key/value is coerced so this does not go
# unnoticed?
# - Convert things to dicts via `__dict__` instead/as well before going to
# `str`? Too magic/not always useful?


class LenientJSONEncoder(json.JSONEncoder):
    """Convert any object to JSON, converting any unserializable keys or values to strings first"""

    def default(self, obj):
        try:
            return super().default(obj)
        except TypeError:
            return str(obj)

    def iterencode(self, obj):
        if isinstance(obj, dict):
            obj = {self.default(key): value for key, value in obj.items()}
        return super().iterencode(obj)


def dump(obj, file_name):
    with open(file_name, "w") as f:
        json.dump(obj, f, indent=2, cls=LenientJSONEncoder)
