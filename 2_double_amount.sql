-- DOUBLE
DROP FUNCTION IF EXISTS double_value;
CREATE OR REPLACE FUNCTION double_value(amount decimal(10,2)) RETURNS decimal(10,2) AS $$
	BEGIN 
		RETURN 2 * amount;
	END
$$ LANGUAGE plpgsql;

SELECT double_value(2);
