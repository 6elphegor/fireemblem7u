"""Find top-level function definitions in C source text."""
import re

IDENT = re.compile(r"[A-Za-z_]\w*")


def _skip(text, i):
    """If text[i:] starts a comment/string/char/preprocessor line, return the
    index just past it; else None."""
    c = text[i]
    if text.startswith("//", i):
        j = text.find("\n", i)
        return len(text) if j < 0 else j
    if text.startswith("/*", i):
        j = text.find("*/", i + 2)
        return len(text) if j < 0 else j + 2
    if c in "\"'":
        j = i + 1
        while j < len(text) and text[j] != c:
            j += 2 if text[j] == "\\" else 1
        return j + 1
    if c == "#" and (i == 0 or text[text.rfind("\n", 0, i) + 1:i].strip() == ""):
        j = i
        while True:
            j = text.find("\n", j)
            if j < 0:
                return len(text)
            if text[j - 1] != "\\":
                return j
            j += 1
    return None


def functions(text):
    """[(name, start, body_open, end)] for each top-level function definition.

    start is where the definition's header begins (after preceding
    whitespace), body_open the index of its '{', end just past its '}'.
    """
    out = []
    i, n = 0, len(text)
    item_start = 0
    depth_paren = 0
    while i < n:
        j = _skip(text, i)
        if j is not None:
            if text[i] == "#":
                item_start = j
            i = j
            continue
        c = text[i]
        if c == "(":
            depth_paren += 1
        elif c == ")":
            depth_paren -= 1
        elif c == ";" and depth_paren == 0:
            item_start = i + 1
        elif c == "{" and depth_paren == 0:
            header = text[item_start:i]
            close = _match_brace(text, i)
            code = _strip_comments(header)
            p = code.find("(")
            if p >= 0 and "=" not in code[:p] and code.rstrip().endswith(")"):
                names = IDENT.findall(code[:p])
                if names:
                    start = item_start + (len(header) - len(header.lstrip()))
                    out.append((names[-1], start, i, close))
                item_start = close
            # data initializer or struct body: continue to its ';'
            i = close
            continue
        i += 1
    return out


def _match_brace(text, i):
    depth = 0
    while i < len(text):
        j = _skip(text, i)
        if j is not None:
            i = j
            continue
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if depth == 0:
                return i + 1
        i += 1
    raise ValueError("unbalanced braces")


def _strip_comments(s):
    s = re.sub(r"/\*.*?\*/", " ", s, flags=re.S)
    return re.sub(r"//[^\n]*", " ", s)


def prototype(text, start, body_open):
    """Declaration for a definition (static/inline dropped: asm symbols are global)."""
    header = _strip_comments(text[start:body_open]).strip()
    header = re.sub(r"\b(static|inline)\s+", "", header)
    return header + ";"
