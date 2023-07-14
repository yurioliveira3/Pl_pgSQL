DROP FUNCTION IF EXISTS mtable_while("number" INTEGER);
CREATE FUNCTION mtable_while("number" INTEGER) RETURNS SETOF TEXT AS $$
	DECLARE multiplier int = 1;
	BEGIN 
		-- WHILE LOOP
		WHILE multiplier <= 10 LOOP
			RETURN NEXT "number" || 'x' || multiplier || '=' || "number" * multiplier;  
		
			multiplier = multiplier + 1;
								
		END LOOP;
	END
$$ LANGUAGE plpgsql;


SELECT mtable_while(9);