class Solution:
    def compress(self, chars: list[str]) -> int:
        read = 0
        write = 0
        n = len(chars)

        while read < n:
            char = chars[read]
            start = read

            # Находим конец группы одинаковых символов.
            while read < n and chars[read] == char:
                read += 1

            count = read - start
            chars[write] = char
            write += 1

            # Для группы из одного символа число не записываем.
            if count > 1:
                for digit in str(count):
                    chars[write] = digit
                    write += 1

        return write