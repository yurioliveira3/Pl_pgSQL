DROP FUNCTION IF EXISTS mtable("number" INTEGER);
CREATE FUNCTION mtable("number" INTEGER) RETURNS SETOF INTEGER AS $$
	BEGIN 
		-- RETURN NEXT => APPEND ROWS TO THE RESULT SET 
		RETURN NEXT "number" * 1;
		RETURN NEXT "number" * 2;
		RETURN NEXT "number" * 3;
		RETURN NEXT "number" * 4;
		RETURN NEXT "number" * 5;
		RETURN NEXT "number" * 6;
		RETURN NEXT "number" * 7;
		RETURN NEXT "number" * 8;
		RETURN NEXT "number" * 9;
	END
	
$$ LANGUAGE plpgsql;


SELECT mtable(9);



DROP FUNCTION IF EXISTS mtable_loop("number" INTEGER);
CREATE FUNCTION mtable_loop("number" INTEGER) RETURNS SETOF TEXT AS $$
	DECLARE multiplier int = 1;
	BEGIN 
		-- LOOP
		LOOP
			RETURN NEXT "number" || 'x' || multiplier || '=' || "number" * multiplier;  
		
			multiplier = multiplier + 1;
								
			EXIT WHEN multiplier = 11;
		END LOOP;
	END
$$ LANGUAGE plpgsql;


SELECT mtable_loop(9);