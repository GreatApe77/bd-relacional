START TRANSACTION;

INSERT INTO
    users(
        first_name,
        last_name,
        email,
        password_hash
    )
VALUES
    ("Joao", "Mendes", "a@a.com", "wouvawdn"),
    ("Maria", "Silva", "b@a.com", "woafuvn"),
    ("Carlos", "Wagner", "c@a.com", "wbrtbouvn"),
    ("Italo", null, "d@a.com", "woagweguvn"),
    ("Yuri", "Mendes", "e@a.com", "wousdrbvn"),
    ("Jonas", "Mendes", "f@a.com", "woeadrbuvn");

COMMIT;