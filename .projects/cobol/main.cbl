       identification division.
       program-id. yolo.
       data division.
       working-storage section.
       01 n       pic s9(9) comp-5.
       01 z       pic s9(10).
       01 s       pic x(10).
       01 m       pic x(100).
       procedure division.
           move 1234567890 to n
           move n to z
           move z to s
           string "your number is " delimited size
                   s delimited size
                   into m
           display m
           stop run
           .
