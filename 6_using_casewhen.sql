DROP FUNCTION IF EXISTS salary_ok_get_collaborator_with_case(collaborator_id int8);
CREATE FUNCTION salary_ok_get_collaborator_with_case(collaborator_id int8) RETURNS TEXT AS $$
	DECLARE collaborator_name TEXT;
	DECLARE collaborator_salary DECIMAL(10,2);

	BEGIN 
		SELECT INTO 
			collaborator_name, collaborator_salary
			--	 -- 
			"name", salary 
		FROM 
			collaboratos 
		WHERE 
			id = collaborator_id;
	
		-- IF THE SALARY AS > 200.00 ITS OK 
		CASE 
			WHEN (collaborator_salary > 200.00) THEN 
				RETURN 'The salary of ' || collaborator_name || ' is OK!';
			-- ELSEIF CAN BE INCREASED
			WHEN (collaborator_salary = 200.00) THEN 
				RETURN 'The salary of ' || collaborator_name || ' can be increased!';
			-- ELSE THEN INCREASE
			ELSE 
				RETURN 'The salary of ' || collaborator_name || ' need be increased!';
		END CASE;
	
	END
$$ LANGUAGE plpgsql; 


SELECT 
 	salary_ok_get_collaborator_with_case(col.id) 
FROM 
    collaboratos AS col; 
