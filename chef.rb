require 'sqlite3'

class Chef
  def self.create_table
    Chef.db.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Alux', 'Cervantes', '1977-06-23', 'alux@gmail.com', '5560937952', DATETIME('now'), DATETIME('now')),
          ('Chantal', 'Peralta', '1980-10-13', 'chanty@hotmail.com', '45585883808', DATETIME('now'), DATETIME('now')),
          ('Bruce', 'Wayne', '1980-10-13', 'batman@gothammail.com', '2286262350', DATETIME('now'), DATETIME('now')),
          ('Albert', 'Einstein', '1879-03-14', 'relatividad@yahoo.com', '45875223890', DATETIME('now'), DATETIME('now')),
          ('James', 'Bond', '17952-06-11', '007@m16.uk', '0070000000', DATETIME('now'), DATETIME('now')),
          ('Marqués', 'de Sade', '1740-06-102', 'pura_pinshi_party@veryhotmail.com', '1234567890', DATETIME('now'), DATETIME('now'));
        -- Añade aquí más registros
      SQL
    )
  end

  def self.all
    Chef.db.execute(
        <<-SQL
          SELECT *
          FROM chefs;
        SQL
      )
  end

  def self.where
    Chef.db.execute(
        <<-SQL
          SELECT *
          FROM chefs
          WHERE first_name = 'Alux'
          OR id = 7;
        SQL
      )
  end

  def self.where
    Chef.db.execute(
        <<-SQL
          SELECT *
          FROM chefs
          WHERE first_name = 'Alux'
          OR id = 7;
        SQL
      )
  end

  def self.new
    Chef.db.execute(
        <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Pedro', 'Picapiedra', '60000 a.C.', 'p.picapiedra@gmail.com', '1234567890', DATETIME('now'), DATETIME('now'));
        SQL
      )
  end

    def self.delete
    Chef.db.execute(
        <<-SQL
        DELETE FROM chefs
        WHERE id=40;
        SQL
      )
  end

  private

  def self.db
    @@db ||= SQLite3::Database.new("chefs.db")
  end

end