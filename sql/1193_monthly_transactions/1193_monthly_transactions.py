import marimo

__generated_with = "0.25.2"
app = marimo.App()


@app.cell
def _():
    import duckdb

    con = duckdb.connect(":memory:")
    con.execute(
        """
        CREATE TABLE Transactions (
            id INTEGER,
            country VARCHAR,
            state VARCHAR,
            amount INTEGER,
            trans_date DATE
        )
        """
    )
    con.execute(
        """
        INSERT INTO Transactions VALUES
            (1, 'US', 'approved', 1000, DATE '2018-12-18'),
            (2, 'US', 'declined', 2000, DATE '2018-12-19'),
            (3, 'US', 'approved', 2000, DATE '2020-01-01'),
            (4, 'DE', 'approved', 2000, DATE '2020-01-07')
        """
    )
    return (con,)


@app.cell
def _():
    import marimo as mo

    return (mo,)


@app.cell
def _(con, mo):
    _df = mo.sql(
        f"""
        SELECT * FROM Transactions
        """,
        engine=con
    )
    return


@app.cell
def _(con, mo):
    _df = mo.sql(
        f"""
        SELECT
        MONTH(trans_date) AS month,
        country,
        COUNT(id) AS trans_count, 
        COUNT(CASE WHEN state == 'approved' THEN 1 END) AS approved_count,
        SUM(amount) AS trans_total_amount,
        SUM(CASE WHEN state == 'approved' THEN amount ELSE 0 END) AS approved_total_amount,     
        FROM
        Transactions
        GROUP BY country, MONTH(trans_date)
        """,
        engine=con
    )
    return


@app.cell
def _(con, mo):
    _df = mo.sql(
        f"""
        CREATE TABLE Employees(
            employee_id INTEGER,
            name VaRCHAR,
            manager_id INTEGER,
            salary INTEGER
        ) 
        """,
        engine=con
    )
    return


@app.cell
def _(con, mo):
    _df = mo.sql(
        f"""
        SELECT * FROM Employees
        """,
        engine=con
    )
    return


@app.cell
def _(con, mo):
    _df = mo.sql(
        f"""
        INSERT INTO Employees (employee_id, name, manager_id, salary)
        VALUES
            (3,  'Mila',      9,    60301),
            (12, 'Antonella', NULL, 31000),
            (13, 'Emery',     NULL, 67084),
            (1,  'Kalel',     11,   21241),
            (9,  'Mikaela',   NULL, 50937),
            (11, 'Joziah',    6,    28485);
        """,
        engine=con
    )
    return


@app.cell
def _(con, mo):
    _df = mo.sql(
        f"""
        SELECT employee_id FROM Employees
        WHERE salary < 30000
        AND manager_id not IN (SELECT employee_id FROM Employees)
        """,
        engine=con
    )
    return


if __name__ == "__main__":
    app.run()
