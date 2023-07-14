DROP FUNCTION IF EXISTS mtable_for("number" INTEGER);
CREATE FUNCTION mtable_for("number" INTEGER) RETURNS SETOF TEXT AS $$
	BEGIN 
		-- FOR LOOP
		FOR multiplier IN 1..10 LOOP
			RETURN NEXT "number" || 'x' || multiplier || '=' || "number" * multiplier;  				
		END LOOP;
	END
$$ LANGUAGE plpgsql;


SELECT mtable_for(9);