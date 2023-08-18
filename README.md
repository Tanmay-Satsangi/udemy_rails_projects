DRY code: Don't repeat yourself

-re - factoring
-extract away the redundancies in code

128.Add user validation 
User  - Add validation
      - Username must be present and unique, min 2 max 25
      - email address must be present and uniqe, max 105
      - email must be valid email format, check with email regex