-- ROW
DROP FUNCTION IF EXISTS return_row;
CREATE OR REPLACE FUNCTION return_row() RETURNS TEXT AS $$
	-- DECLARE row_return TEXT
	BEGIN 
		RETURN ROW(22,'Test','213213',200::decimal);
	
		/* OR 
		 * SELECT 22,'Test','213213',200::decimal INTO row_return;
		 * 
		 * RETURN row_return;
		 */
	END
$$ LANGUAGE plpgsql;

SELECT return_row();
