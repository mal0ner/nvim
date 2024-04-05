local ls = require("luasnip")
local s = ls.s
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local get_type = function(node_index)
  return f(function(type)
    return type[1]
  end, { node_index })
end

local get_name = function(node_index)
  return f(function(name)
    return name[1]
  end, { node_index })
end

local snippets = {}

-- leetcode starter
table.insert(
  snippets,
  s(
    "leet",
    fmt(
      [[
        #include <string>
        #include <iostream>
        #include <ostream>
        #include <vector>
        #include <unordered_map>

        using namespace std;

        class Solution {{
        public:
          static {} {}({} {}) {{
            {} result;
            {}
            return result;
          }}
        }};

        int main(int argc, char *argv[]) {{
          cout << "EXEC TEST: {}" << endl;

          {} test_case = {};
          {} result = Solution::{}(test_case);
          {} correct = {};

          if (result == correct) {{
            printf("%c[%dmSUCCESS:%c[%dm\n", 0x1b, 32, 0x1b, 39);
            cout << "  test_value: " << test_case << endl;
            cout << "  correct:    " << correct << endl;
            cout << "  result:     " << result << endl;
            return 0;
          }}
          printf("%c[%dmFAILED:%c[%dm\n", 0x1b, 31, 0x1b, 39);
          cout << "  test_value: " << test_case << endl;
          cout << "  correct:    " << correct << endl;
          cout << "  result:     " << result << endl;
          return 0;
        }}
      ]],
      {
        -- function type and name
        i(1, "type"),
        i(2, "function"),
        -- function params
        i(3, "type"),
        i(4, "id"),
        -- function body result type
        get_type(1),
        -- function body
        i(0, 'cout << "function body" << endl;'),
        -- stdout string
        get_name(2),
        -- test case
        get_type(3),
        i(5, "test_value"),
        -- call solution function
        get_type(1),
        get_name(2),
        -- correct value
        get_type(1),
        i(6, "correct_value"),
      }
    )
  )
)

-- readfile starter
table.insert(
  snippets,
  s(
    "rflines",
    fmt(
      [[
      #include <iostream>
      #include <fstream>
      #include <string>

      int main (int argc, char *argv[]) {{
        std::ifstream f("{}");
        std::string line;

        if (f.is_open()) {{
          while(std::getline(f, line)) {{
            {};
          }}

          f.close();
        }} else {{
          std::cout << "unable to open file" << std::endl;
        }}
        return 0;
      }}
  ]],
      {
        i(1, "filename"),
        i(2, "//do something..."),
      }
    )
  )
)

-- read whole file into string
table.insert(
  snippets,
  s(
    "rflines",
    fmt(
      [[
      #include <iostream>
      #include <fstream>
      #include <string>

      int main (int argc, char *argv[]) {{
        std::ifstream f("{}");
        std::string line;

        if (f.is_open()) {{
          while(std::getline(f, line)) {{
            {};
          }}

          f.close();
        }} else {{
          std::cout << "unable to open file" << std::endl;
        }}
        return 0;
      }}
  ]],
      {
        i(1, "filename"),
        i(2, "//do something..."),
      }
    )
  )
)

return snippets
