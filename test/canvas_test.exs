defmodule CanvasTest do
    use ExUnit.Case
    import TestHelper

    def canvas(list), do: Enum.join(list, "\n")

    test "normal canvas write" do
        assert evaluate_canvas("5 'a 3Λ") == canvas([
            "a    ",
            " a   ",
            "  a  ",
            "   a ",
            "    a"
        ])

        assert evaluate_canvas("5 'a 7Λ") == canvas([
            "a    ",
            " a   ",
            "  a  ",
            "   a ",
            "    a"
        ])
    end

    test "normal canvas write with two writes" do
        assert evaluate_canvas("3 'a 3Λ 3 'a 1Λ") == canvas([
            "a   a",
            " a a ",
            "  a  "
        ])
    end

    test "direction up test" do
        assert evaluate_canvas("3 'a 0Λ") == canvas([
            "a", 
            "a", 
            "a"
        ])
    end

    test "direction up-right test" do
        assert evaluate_canvas("3 'a 1Λ") == canvas([
            "  a", 
            " a ", 
            "a  "
        ])
    end

    test "direction right test" do
        assert evaluate_canvas("3 'a 2Λ") == canvas([
            "aaa"
        ])
    end

    test "direction down-right test" do
        assert evaluate_canvas("3 'a 3Λ") == canvas([
            "a  ",
            " a ",
            "  a"
        ])
    end

    test "direction down test" do
        assert evaluate_canvas("3 'a 4Λ") == canvas([
            "a",
            "a",
            "a"            
        ])
    end

    test "direction down-left test" do
        assert evaluate_canvas("3 'a 5Λ") == canvas([
            "  a",
            " a ",
            "a  "           
        ])
    end

    test "direction left test" do
        assert evaluate_canvas("3 'a 6Λ") == canvas([
            "aaa"
        ])
    end

    test "direction up-left test" do
        assert evaluate_canvas("3 'a 7Λ") == canvas([
            "a  ",
            " a ",
            "  a"
        ])
    end

    test "canvas in subprogram test" do
        assert evaluate_canvas("8F3 'a NΛ") == canvas([
            "  aaa  ",
            " a   a ",
            "a     a",
            "a     a",
            "a     a",
            " a   a ",
            "  aaa  "
        ])
    end

    test "canvas with multiple direction vals test" do
        assert evaluate_canvas("3 'a 76Λ") == canvas([
            "aaa  ",
            "   a ",
            "    a"
        ])

        assert evaluate_canvas("3 'a 720Λ") == canvas([
            "  a",
            "  a",
            "aaa",
            " a ",
            "  a"
        ])
    end

    test "canvas with multiple chars in string" do
        assert evaluate_canvas("5 \"abc\" 7Λ") == canvas([
            "b    ",
            " a   ",
            "  c  ",
            "   b ",
            "    a"
        ])
    end

    test "canvas with multiple chars and multiple directions" do
        assert evaluate_canvas("4 \"abc\" 024Λ") == canvas([
            "abca",
            "c  b",
            "b  c",
            "a  a"
        ])

        assert evaluate_canvas("6 \"abc\" 024Λ") == canvas([
            "cabcab",
            "b    c",
            "a    a",
            "c    b",
            "b    c",
            "a    a"
        ])
    end

    test "canvas with single char and multiple directions as list" do
        assert evaluate_canvas("3 'a 720SΛ") == canvas([
            "  a",
            "  a",
            "aaa",
            " a ",
            "  a"
        ])
    end

    test "canvas with string and multiple directions as list" do
        assert evaluate_canvas("3 \"abc\" 720SΛ") == canvas([
            "  a",
            "  c",
            "cab",
            " b ",
            "  a"
        ])

        assert evaluate_canvas("5 \"abc\" 720SΛ") == canvas([
            "    a",
            "    c",
            "    b",
            "    a",
            "bcabc",
            " a   ",
            "  c  ",
            "   b ",
            "    a"
        ])
    end

    test "canvas with chars as list" do
        assert evaluate_canvas("5 \"abc\"S 3Λ") == canvas([
            "a    ",
            " b   ",
            "  c  ",
            "   a ",
            "    b"
        ])

        assert evaluate_canvas("5 \"abc\"S 34Λ") == canvas([
            "a    ",
            " b   ",
            "  c  ",
            "   a ",
            "    b",
            "    c",
            "    a",
            "    b",
            "    c"
        ])
    end

    test "canvas with chars and directions as list" do
        assert evaluate_canvas("4 \"abc\"S 34SΛ") == canvas([
            "a   ",
            " b  ",
            "  c ",
            "   a",
            "   b",
            "   c",
            "   a"
        ])
    end

    test "canvas with length as list" do
        assert evaluate_canvas("34S \"a\" 3Λ") == canvas([
            "a     ",
            " a    ",
            "  a   ",
            "   a  ",
            "    a ",
            "     a"
        ])
    end

    test "canvas with length as list and multiple characters" do
        assert evaluate_canvas("34S \"abc\" 3Λ") == canvas([
            "a     ",
            " b    ",
            "  c   ",
            "   a  ",
            "    b ",
            "     c"
        ])
    end

    test "canvas with length as list and multiple directions" do
        assert evaluate_canvas("34S \"abc\" 34Λ") == canvas([
            "a     ",
            " b    ",
            "  c   ",
            "  a   ",
            "  b   ",
            "   c  ",
            "    a ",
            "     b",
            "     c",
            "     a",
            "     b"
        ])
    end

    test "canvas with length and directions as list" do
        assert evaluate_canvas("4424S'A1376SΛ") == canvas([
            "   A   ",
            "  A A  ",
            " AAAAA ",
            "A     A"
        ])
    end

    test "canvas with length and characters as list" do
        assert evaluate_canvas("234S\"abc\"S42Λ") == canvas([
            "a                  ",
            "aa                 ",
            " a                 ",
            " aaa               ",
            "   a               ",
            "   a               ",
            "   aaab            ",
            "      bb           ",
            "       b           ",
            "       bbb         ",
            "         b         ",
            "         b         ",
            "         bbbc      ",
            "            cc     ",
            "             c     ",
            "             ccc   ",
            "               c   ",
            "               c   ",
            "               cccc"
        ])
    end
    
    test "canvas with length, characters and directions as list" do
        assert evaluate_canvas("345S\"abc\"S420SΛ") == canvas([
            "   c",
            "   c",
            "a  c",
            "a  c",
            "bbbc"
        ])
    end
end